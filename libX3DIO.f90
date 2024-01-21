! libX3DIO.f90
! Date : 1-1-2022
! Author:  Vu Hoang Giang
! Website : https://www.cae1.ddns.net
! GitHub:  https://github.com/v-h-giang
! Licence: MIT 

module X3DIO
      use,intrinsic :: iso_fortran_env, only: error_unit,iostat_end,iostat_eor
      use,intrinsic :: iso_c_binding, only: c_ptr,c_null_ptr, c_null_char,c_float
      use :: sdl2
      implicit none

      TYPE :: faceset 
            INTEGER                                   :: pointnum
            INTEGER,DIMENSION(:),allocatable          :: points_index
            real(8),DIMENSION(:,:),allocatable        :: points_coordinate
            INTEGER                                   :: facenum
            INTEGER                                   :: colornum
            real(8),DIMENSION(:,:),allocatable        :: color
            INTEGER,DIMENSION(:),allocatable          :: faces_color_index 
            contains
            PROCEDURE                                 :: display => X3D_display
      END TYPE 
      
contains

      FUNCTION X3D_get_IndexedFaceSet(filename,faces_set_array,facesetnum)
            implicit none
            CHARACTER(len = *)                                   :: filename 
            INTEGER                                              :: i ,k,n, anyunit ,ios
            CHARACTER(len = 260)                                 :: buffer 
            CHARACTER(len = :),ALLOCATABLE                       :: metavalue_str  

            INTEGER                                              :: facesetnum 
            TYPE(faceset),DIMENSION(:),ALLOCATABLE               :: faces_set_array
            INTEGER                                              :: from_index,to_index
 
            INTEGER,DIMENSION(:),ALLOCATABLE                     :: tags_indices
            CHARACTER(len = 32),DIMENSION(:),ALLOCATABLE         :: meta_tags 
            CHARACTER(len = :),ALLOCATABLE                       :: meta_tag
            INTEGER                                              :: X3D_get_IndexedFaceSet

            X3D_get_IndexedFaceSet = 0

            facesetnum = count_meta_tags(filename, "<IndexedFaceSet",tags_indices)
            IF (ALLOCATED(faces_set_array)) DEALLOCATE(faces_set_array)
            ALLOCATE(faces_set_array(facesetnum))
            faces_set_array = faceset(0,[0],RESHAPE([0.0,0.0,0.0],[3,1]),0,0,RESHAPE([0.0,0.0,0.0],[3,1]),[0])

            OPEN(newunit = anyunit, file = filename, STATUS ="old", FORM = "formatted",ACTION ="read",iostat = ios )
            if ( ios /= 0 ) then
              write ( *, '(a)' ) ' '
              write ( *, '(a)' ) 'count_meta_tags_from_to - Fatal error!'
              write ( *, '(a)' ) '  Could not open the file "' // &
                trim ( filename ) // '".'
                X3D_get_IndexedFaceSet = -1 
              return
            end if 

            i = 0
            k = 1
            n = 1 

            meta_tags = [[CHARACTER(len=32) :: "coordIndex"], &
                         [CHARACTER(len=32) :: "colorIndex"], &
                         [CHARACTER(len=32) :: "point"],&
                         [CHARACTER(len=32) :: "color"]]

            meta_tag = TRIM(ADJUSTL(meta_tags(n)))

            if (k /= SIZE(tags_indices)) then 
                  from_index = tags_indices(k)
                  to_index = tags_indices(k+1)
            else 
                  from_index = tags_indices(k)
                  to_index = from_index + 100
            end if 


            DO
                  i = i + 1 

                  READ(anyunit,*,iostat = ios) buffer

                  SELECT CASE (ios)
                  CASE (0)
                        if ((i <= to_index).AND.(i >= from_index)) then 

                              if (INDEX(buffer, "</IndexedFaceSet>") /= 0) then 
                                    k = k + 1 
                                    if (k /= SIZE(tags_indices)) then 
                                          from_index = tags_indices(k)
                                          to_index = tags_indices(k+1)
                                    else 
                                          from_index = tags_indices(k)
                                          to_index = from_index + 100
                                    end if 
                                    CYCLE
                              end if 
                              if (INDEX(buffer,meta_tag) == 0) CYCLE 
                              if (INDEX(buffer,meta_tag) /= 0) then 
                                    PRINT *, "Detected meta tag " ,meta_tag , "in line ", i

                                    BACKSPACE(anyunit)
                                    metavalue_str = GET_META_VALUE(anyunit)

                                    if (meta_tag == "coordIndex") then 
                                          faces_set_array(k)%points_index = IndexArray_from_meta_value(metavalue_str) 
                                          
                                          faces_set_array(k)%pointnum = SIZE(faces_set_array(k)%points_index)
                                          n = n + 1 
                                          if (n > SIZE(meta_tags)) n = 1
                                          meta_tag = TRIM(ADJUSTL(meta_tags(n)))
                                          CYCLE
                                    end if 

                                    if (meta_tag == "colorIndex") then 
                                          faces_set_array(k)%faces_color_index= IndexArray_from_meta_value(metavalue_str) 
                                          faces_set_array(k)%facenum = SIZE(faces_set_array(k)%faces_color_index)
                                          n = n + 1 
                                          if (n > SIZE(meta_tags)) n = 1
                                          meta_tag = TRIM(ADJUSTL(meta_tags(n)))
                                          CYCLE
                                    end if 

                                    if (meta_tag == "point") then 
                                          faces_set_array(k)%points_coordinate = VecterArray_from_meta_value(metavalue_str)
                                          n = n + 1 
                                          if (n > SIZE(meta_tags)) n = 1
                                          meta_tag = TRIM(ADJUSTL(meta_tags(n)))
                                          CYCLE
                                    end if 
                                    
                                    if (meta_tag == "color") then 
                                          faces_set_array(k)%color = VecterArray_from_meta_value(metavalue_str)
                                          faces_set_array(k)%colornum = SIZE(faces_set_array(k)%color)
                                          n = n + 1 
                                          if (n > SIZE(meta_tags)) n = 1
                                          meta_tag = TRIM(ADJUSTL(meta_tags(n)))


                                          k = k +1 
                                          if (k /= SIZE(tags_indices)) then 
                                                from_index = tags_indices(k)
                                                to_index = tags_indices(k+1)
                                          else 
                                                from_index = tags_indices(k)
                                                to_index = from_index + 100
                                          end if 

                                          
                                          CYCLE
                                    end if 
                              end if 
                        end if 
                  CASE(iostat_end)
                        Exit
                  CASE Default
                        PRINT *, "Some wrong in reading file ", filename, &
                                 "in line " , i 
                        X3D_get_IndexedFaceSet = -1 
                        CLOSE(anyunit)
                        RETURN  
                  END SELECT 
            END DO 


      END FUNCTION X3D_get_IndexedFaceSet

      FUNCTION count_meta_tags_from_to(filename,meta_tags, meta_tags_line_indices,from_index,to_index )
            implicit none
            CHARACTER(len = *)                        :: filename 
            CHARACTER(len = *)                        :: meta_tags 
            INTEGER                                   :: i , anyunit ,ios
            INTEGER,DIMENSION(:),ALLOCATABLE          :: meta_tags_line_indices
            CHARACTER(len = 260)                      :: buffer 
            INTEGER                                   :: count_meta_tags_from_to 
            INTEGER                                   :: from_index,to_index

            count_meta_tags_from_to = 0

            if (from_index >= to_index) then
                  write ( *, '(a)' ) ' '
                  write ( *, '(a)' ) 'count_meta_tags_from_to - Fatal error!'
                  write ( *, '(a)' ) ' from_index bad value !   '
                    count_meta_tags_from_to = -1
                  return
            end if 

            OPEN(newunit = anyunit, file = filename, STATUS ="old", FORM = "formatted", iostat = ios )
            if ( ios /= 0 ) then
              write ( *, '(a)' ) ' '
              write ( *, '(a)' ) 'count_meta_tags_from_to - Fatal error!'
              write ( *, '(a)' ) '  Could not open the file "' // &
                trim ( filename ) // '".'
                count_meta_tags_from_to = -1
              return
            end if 


            if (ALLOCATED(meta_tags_line_indices)) DEALLOCATE(meta_tags_line_indices)
            ALLOCATE(meta_tags_line_indices(1))

            i = 0
            DO    
                  i = i + 1 
                  if (i > to_index) exit 

                  READ(anyunit,*,iostat = ios) buffer
                  SELECT CASE (ios)
                  CASE (0)
                        if ((i <= to_index).AND.(i >= from_index)) then 
                              if (INDEX(buffer,meta_tags) == 0) CYCLE 
                              if (INDEX(buffer,meta_tags) /= 0) then 
                                    count_meta_tags_from_to = count_meta_tags_from_to + 1
                                    if (count_meta_tags_from_to == 1) meta_tags_line_indices = i 
                                    if (count_meta_tags_from_to > 1) &
                                     meta_tags_line_indices = [meta_tags_line_indices,i]
                              end if 
                        end if 
                  CASE(iostat_end)
                        Exit
                  CASE Default
                        PRINT *, "Some wrong in reading file ", filename, &
                                 "in line " , i 
                        count_meta_tags_from_to = -1 
                        CLOSE(anyunit)
                        Stop
                  END SELECT 
            END DO 
            CLOSE(anyunit)
            if (count_meta_tags_from_to <= 0) then 
                  if (ALLOCATED(meta_tags_line_indices)) DEALLOCATE(meta_tags_line_indices)
            end if 
      END FUNCTION count_meta_tags_from_to

      FUNCTION count_meta_tags(filename,meta_tags, meta_tags_line_indices)
            implicit none
            CHARACTER(len = *)                        :: filename 
            CHARACTER(len = *)                        :: meta_tags 
            INTEGER                                   :: i , anyunit ,ios
            INTEGER,DIMENSION(:),ALLOCATABLE          :: meta_tags_line_indices
            CHARACTER(len = 260)                      :: buffer 
            INTEGER                                   :: count_meta_tags 

            if (ALLOCATED(meta_tags_line_indices)) DEALLOCATE(meta_tags_line_indices)
            ALLOCATE(meta_tags_line_indices(1))

            count_meta_tags = 0
            PRINT *, "file name " , filename
            PRINT *, "meta tags " , meta_tags

            OPEN(newunit = anyunit, file = filename, STATUS ="old", FORM = "formatted", iostat = ios )
            if ( ios /= 0 ) then
              write ( *, '(a)' ) ' '
              write ( *, '(a)' ) 'Get_IndexedFaceSet - Fatal error!'
              write ( *, '(a)' ) '  Could not open the file "' // &
                trim ( filename ) // '".'
                count_meta_tags = -1
              return
            end if 

            i = 0
            DO    
                  i = i + 1 

                  READ(anyunit,*,iostat = ios) buffer
                  SELECT CASE (ios)
                  CASE (0)
                        if (INDEX(buffer,meta_tags) == 0) CYCLE 
                        if (INDEX(buffer,meta_tags) /= 0) then 
                              count_meta_tags = count_meta_tags + 1
                              if (count_meta_tags == 1) meta_tags_line_indices = i 
                              if (count_meta_tags > 1) meta_tags_line_indices = [meta_tags_line_indices,i]
                        end if 
                  CASE(iostat_end)
                        Exit
                  CASE Default
                        PRINT *, "Some wrong in reading file ", filename, &
                        "in line " , i 
                        count_meta_tags = -1 
                        EXIT 
                  END SELECT 
            
            END DO 
            CLOSE(anyunit)
            if (count_meta_tags <= 0) then 
                  if (ALLOCATED(meta_tags_line_indices)) DEALLOCATE(meta_tags_line_indices)
            end if 
      END FUNCTION count_meta_tags

      FUNCTION READ_ALL_LINE(fileunit)
            implicit none
            INTEGER                             :: fileunit , ios , sz 
            CHARACTER(len=:),ALLOCATABLE        :: READ_ALL_LINE
            CHARACTER(len = 260)                :: buffer 

            READ_ALL_LINE = ""
            DO
                  READ(fileunit,'(A)', ADVANCE = "NO", IOSTAT = ios ,SIZE = sz ) buffer
                  ! PRINT "('stat was ',I0,', SIZE was ',I0,' and buffer was ""',A,'""')",  &
                  !   ios, sz, TRIM(buffer)
                  
                  SELECT CASE (ios) 
                  CASE (0)
                        READ_ALL_LINE = READ_ALL_LINE // buffer(:sz)
                  CASE (iostat_end) 
                        PRINT *, "End of file !"
                        EXIT
                  CASE (iostat_eor)
                        READ_ALL_LINE = READ_ALL_LINE // buffer(:sz)
                        PRINT *, "End of record ! "
                        EXIT
                  CASE Default
                        PRINT *, "Some wrong in READ_ALL_LINE"
                        EXIT                         
                  END SELECT 
            END DO
      END FUNCTION READ_ALL_LINE

      FUNCTION GET_META_VALUE(fileunit)
            implicit none
            INTEGER                             :: fileunit , pos1,pos2
            CHARACTER(len=:),ALLOCATABLE        :: metatag_allline
            CHARACTER(len=:),ALLOCATABLE        :: GET_META_VALUE

            metatag_allline = READ_ALL_LINE(fileunit)

            pos1 = INDEX(metatag_allline,'"')
            pos2 = INDEX(metatag_allline,'"',BACK=.TRUE.)

            GET_META_VALUE = metatag_allline(pos1+1:pos2-1)
            if (ALLOCATED(metatag_allline)) DEALLOCATE(metatag_allline)

      END FUNCTION GET_META_VALUE

      FUNCTION IndexArray_from_meta_value(metavalue_str)
            implicit none
            CHARACTER(len = *)                        :: metavalue_str
            INTEGER                                   :: array_size , i,ios
            INTEGER,DIMENSION(:),ALLOCATABLE          :: IndexArray_from_meta_value

            array_size = 1

            if (LEN_TRIM(metavalue_str) /= 0) then 
                  do i = 1 , len(metavalue_str)
                        if (metavalue_str(i:i) == ",") array_size = array_size + 1
                  end do 
            else 
                  ALLOCATE(IndexArray_from_meta_value(0))
                  RETURN
            end if 

            ALLOCATE(IndexArray_from_meta_value(array_size))

            READ(metavalue_str,*,iostat= ios) IndexArray_from_meta_value
            SELECT CASE (ios)
            CASE (0)
                  RETURN
            CASE (iostat_end) 
                  RETURN
            CASE Default
                  PRINT *, "Some wrong in read index array from meta value " 
                  PRINT *, metavalue_str
                  RETURN
            END SELECT  

      END FUNCTION IndexArray_from_meta_value

      FUNCTION VecterArray_from_meta_value(metavalue_str)
            implicit none
            CHARACTER(len = *)                        :: metavalue_str
            INTEGER                                   :: array_size , i,ios
            REAL(8),DIMENSION(:,:),ALLOCATABLE        :: VecterArray_from_meta_value

            array_size = 1
            do i = 1 , len(metavalue_str)
                  if (metavalue_str(i:i) == ",") array_size = array_size + 1
            end do 

            ALLOCATE(VecterArray_from_meta_value(3,array_size))
            READ(metavalue_str,*,iostat= ios)  VecterArray_from_meta_value
            SELECT CASE (ios)
            CASE (0)
                  RETURN
            CASE (iostat_end) 
                  RETURN
            CASE Default
                  PRINT *, "Some wrong in read index array from meta value " 
                  PRINT *, metavalue_str
                  RETURN
            END SELECT  

      END FUNCTION VecterArray_from_meta_value

      subroutine X3D_display(self,camera_,glwindow, textures_id,yaw_angle,roll_angle)
                  !! The X3D_display routine, called every frame.
                  CLASS(faceset)                                   :: self 
                  type(camera_type), intent(inout)                 :: camera_
                  integer,           intent(inout)                 :: textures_id
                  INTEGER                                          :: ii,kk 
                  REAL                                             :: yaw_angle
                  REAL                                             :: roll_angle
                  real ( kind = 8 )                                :: maxx, maxy,maxz
                  real ( kind = 8 )                                :: minx, miny,minz
                  REAL                                             :: linewidhth(1)
      
                  real                                             :: ambient(4)
                  real                                             :: diffuse(4)
                  real                                             :: specular(4)
                  real                                             :: emission(4)
                  real                                             :: shininess
                  type(c_ptr)                                      :: glwindow

                  linewidhth = 1.0
                  ! ambient   = [ 0.3, 0.3, 0.3, 1.0 ]
                  ! diffuse   = [ 0.9, 0.9, 0.9, 1.0 ]
                  ! specular  = [ 0.9, 0.9, 0.9, 1.0 ]
                  ! emission  = [ 0.3, 0.3, 0.3, 1.0 ]
      
                  ambient   = [ 0.3, 0.3, 0.3, 1.0 ]
                  diffuse   = [ 0.0, 0.0, 0.0, 1.0 ]
                  specular  = [ 0.0, 0.0, 0.0, 1.0 ]
                  emission  = [ 0.3, 0.3, 0.3, 1.0 ]
                  shininess = 20
      
                  maxx = MAXVAL(self%points_coordinate(1,:))
                  maxy = MAXVAL(self%points_coordinate(2,:))
                  maxz = MAXVAL(self%points_coordinate(3,:))
      
                  minx = MINVAL(self%points_coordinate(1,:))
                  miny = MINVAL(self%points_coordinate(2,:))
                  minz = MINVAL(self%points_coordinate(3,:))


            
                  call glclear(ior(GL_COLOR_BUFFER_BIT, GL_DEPTH_BUFFER_BIT)) ! Clear the screen and depth buffer.
                  call glmatrixmode(GL_MODELVIEW)                             ! Alter model view matrix.
                  call glloadidentity()                                       ! Reset current model view matrix.
      
                  ! camera xoay quanh trục y thì tính sin cos cho xz và cho eye%y là 0 ở hàm glulookat
                  
                  call glulookat(camera_%eye%x, camera_%eye%y, camera_%eye%z, &
                  REAL((maxx+minx)*0.5,8), REAL((maxy+miny)*0.5,8), REAL((maxz+minz)*0.5,8), &
                               0.0_8, 0.0_8, 1.0_8)
      
      
      
                  CALL glclear(GL_COLOR_BUFFER_BIT)
                  call glenable(GL_TEXTURE_2D)

                        call glbindtexture(GL_TEXTURE_2D,textures_id)
      
                        CALL glEnable(GL_BLEND)
                        CALL glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
                        ! CALL glMatrixMode(GL_PROJECTION)
      
                        call glpushmatrix()
                        call glscalef(1.0, 1.0, 1.0)
                        CALL gltranslatef( REAL(maxx+minx)*0.5, REAL(maxy+miny)*0.5, REAL(maxz+minz)*0.5)
                        call glrotatef(yaw_angle, 0.0, 0.0, 1.0)    ! Rotate cube in X.
                        call glrotatef(roll_angle, 0.0, 1.0, 0.0)    ! Rotate cube in Y.
                        CALL gltranslatef( -REAL(maxx+minx)*0.5, -REAL(maxy+miny)*0.5, -REAL(maxz+minz)*0.5)
      
                        call glmaterialfv(GL_FRONT, GL_AMBIENT,  ambient)
                        call glmaterialfv(GL_FRONT, GL_DIFFUSE,  diffuse)
                        call glmaterialfv(GL_FRONT, GL_SPECULAR, specular)
                        call glmaterialf(GL_FRONT, GL_SHININESS, shininess)
                        call glmaterialfv(GL_FRONT, GL_EMISSION, emission)
      
                        CALL glpolygonmode(GL_FRONT_AND_BACK ,GL_FILL)

                              kk = 1
                              call glbegin(GL_TRIANGLES)
                                    call glcolor3f(REAL(self%color(1,self%faces_color_index(kk)+1)), &
                                                   REAL(self%color(2,self%faces_color_index(kk)+1)), &
                                                   REAL(self%color(3,self%faces_color_index(kk)+1)))

                                    do ii = 1, self%pointnum
                                          if (self%points_index(ii) == -1) then  
                                                kk = MIN(kk + 1, self%colornum)
                                                call glcolor3f(REAL(self%color(1,self%faces_color_index(kk)+1)), &
                                                               REAL(self%color(2,self%faces_color_index(kk)+1)), &
                                                               REAL(self%color(3,self%faces_color_index(kk)+1)))
                                                CYCLE
                                          end if 
  
                                          call glvertex3f(REAL(self%points_coordinate(1,self%points_index(ii)+1)),&
                                                REAL(self%points_coordinate(2,self%points_index(ii)+1)),&
                                                REAL(self%points_coordinate(3,self%points_index(ii)+1)) )
                                    end do 
                              call glend()
      
                              ! CALL glpolygonmode(GL_FRONT_AND_BACK ,GL_LINE)
                              ! CALL glGetFloatv(GL_LINE_WIDTH, linewidhth)
                              ! CALL gllinewidth(linewidhth(1)*3)
                              ! call glbegin(GL_TRIANGLES)
                              !       call glcolor3f(0.5,0.5,0.5)
                              !       do ii = 1, self%pointnum
                              !             if (self%points_index(ii) == -1) then  
                              !                   CYCLE
                              !             end if 

                              !             call glvertex3f(REAL(self%points_coordinate(1,self%points_index(ii)+1)),&
                              !             REAL(self%points_coordinate(2,self%points_index(ii)+1)),&
                              !             REAL(self%points_coordinate(3,self%points_index(ii)+1)) )
                              !       end do 
                              ! call glend()
      
                        ! CALL gllinewidth(linewidhth(1))
                        call glpopmatrix()
                        ! angle = MODULO(angle + 5.0 , 360.0)
                  call gldisable(GL_TEXTURE_2D)
                  
                  
                  call sdl_gl_swap_window(glwindow)

      end subroutine
end module X3DIO
