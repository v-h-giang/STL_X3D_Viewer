!!! readstl_opengl.f90
! Date    : 1-1-2022
! Author  : Vu Hoang Giang
! Mail    : hgiang.fukui@gmail.com
! Website : https://www.cae1.ddns.net
! GitHub  : https://github.com/v-h-giang
! Licence : MIT 

program stlread
      use, intrinsic :: iso_c_binding
      use, intrinsic :: iso_fortran_env, only: stderr => error_unit, stdout => output_unit
      use :: sdl2
      USE :: stla_io
      USE :: X3DIO

      implicit None 

      integer, parameter :: SCREEN_WIDTH  = 800
      integer, parameter :: SCREEN_HEIGHT = 600


      character (len = 80)                      :: STL_file
      integer                                   :: solid_num, face_num, text_num, ierror
      integer ( kind = 4 )                      :: node_num , node_xyz_index 
      real ( kind = 8 ), allocatable            :: node_xyz(:,:)
      integer ( kind = 4 ) , allocatable        :: face_node(:,:)
      real ( kind = 8 ), allocatable            :: face_normal(:,:)
      real ( kind = 8 )                         :: max_x, max_y,max_z
      real ( kind = 8 )                         :: min_x, min_y,min_z
      type(c_ptr)                               :: context
      type(c_ptr)                               :: window
      type(sdl_event)                           :: event
      type(camera_type)                         :: camera
      integer(kind=1), pointer                  :: keys(:)
      integer,DIMENSION(:),ALLOCATABLE          :: textures
      integer                                   :: i,  rc

      REAL(8)                                   :: scroll_wheel
      REAL                                      :: angle_yaw
      REAL                                      :: angle_roll 
      CHARACTER(len=260)                        :: arg
      INTEGER                                   :: rcs ,facesetnum
      TYPE(faceset),DIMENSION(:),ALLOCATABLE    :: faces_set_array
      
      scroll_wheel = 5.0
      angle_roll = 0.0
      angle_yaw = 0.0
      node_num = 0
      face_num = 0
      node_xyz_index = 0
      CALL GET_COMMAND_ARGUMENT(1,arg)
      if (arg == "")  STOP "specify a x3d  or stl file"
      STL_file = TRIM(arg)
      PRINT *, "openning file :" ,arg, STL_file


      if (INDEX(arg,"stl") /= 0) then 

            if (stla_check(TRIM(STL_file))) then
                  call stla_size(TRIM(STL_file), solid_num, node_num, face_num, text_num)

                  allocate(textures(solid_num))
                  allocate(node_xyz(3,node_num))
                  allocate(face_node(3,face_num))
                  allocate(face_normal(3,face_num))
                  call stla_size_print(STL_file, solid_num, node_num, face_num, &
                  text_num )
                  call stla_read(STL_file, node_num, face_num, node_xyz, &
                  face_node, face_normal, ierror )
            else
                  CALL STLbinary_read(TRIM(STL_file), node_num, face_num,face_normal,node_xyz)
                  allocate(textures(1))
                  solid_num = 1
            end if
      else if (INDEX(arg,"x3d") /= 0) then 
            rcs = X3D_get_IndexedFaceSet(STL_file,faces_set_array,facesetnum)
            solid_num = facesetnum
            allocate(textures(solid_num))
            do i = 1, facesetnum
                  node_num = node_num + SIZE(faces_set_array(i)%points_coordinate,2)
            end do 
            allocate(node_xyz(3,node_num))
            do i = 1,facesetnum
                  if (i == 1 ) then 
                        node_xyz(:,1:SIZE(faces_set_array(i)%points_coordinate,2)) = faces_set_array(i)%points_coordinate(:,:)
                        node_xyz_index = node_xyz_index + SIZE(faces_set_array(i)%points_coordinate,2)
                  else  
                        node_xyz(:,node_xyz_index+1:node_xyz_index+SIZE(faces_set_array(i)%points_coordinate,2)) =&
                         faces_set_array(i)%points_coordinate(:,:)
                        node_xyz_index = node_xyz_index + SIZE(faces_set_array(i)%points_coordinate,2)
                  end if 
            end do
      end if 

      if (sdl_init(SDL_INIT_EVERYTHING) < 0) then
            write (stderr, '(2a)') 'SDL Error: ', sdl_get_error()
            stop
      end if

      if (img_init(IMG_INIT_PNG) < 0) then
            write (stderr, '(2a)') 'SDL Error: ', sdl_get_error()
            stop
      end if

      rc = sdl_gl_set_attribute(SDL_GL_DEPTH_SIZE,         16)
      rc = sdl_gl_set_attribute(SDL_GL_BUFFER_SIZE,        32)
      rc = sdl_gl_set_attribute(SDL_GL_MULTISAMPLEBUFFERS, 1)
      rc = sdl_gl_set_attribute(SDL_GL_MULTISAMPLESAMPLES, 2)

      ! Create the SDL window.
      window = sdl_create_window(TRIM(STL_file) // c_null_char, &
                              SDL_WINDOWPOS_UNDEFINED, &
                              SDL_WINDOWPOS_UNDEFINED, &
                              SCREEN_WIDTH, &
                              SCREEN_HEIGHT, &
                              ior(SDL_WINDOW_OPENGL, SDL_WINDOW_SHOWN))

      if (.not. c_associated(window)) then
      write (stderr, '(2a)') 'SDL Error: ', sdl_get_error()
      stop
      end if

      ! Create OpenGL context.
      context = sdl_gl_create_context(window)

      max_x = MAXVAL(node_xyz(1,:))
      max_y = MAXVAL(node_xyz(2,:))
      max_z = MAXVAL(node_xyz(3,:))

      min_x = MINVAL(node_xyz(1,:))
      min_y = MINVAL(node_xyz(2,:))
      min_z = MINVAL(node_xyz(3,:))
      
      PRINT *, "x ",min_x , max_x
      PRINT *, "y ",min_y , max_y
      PRINT *, "z ",min_z , max_z

      scroll_wheel = MAX(ABS(max_x),ABS(min_x), ABS(max_y),ABS(min_y),ABS(max_z),ABS(min_z))*2.0_8

      call gl_init(SCREEN_WIDTH, SCREEN_HEIGHT,0.1_8,  scroll_wheel*4)

      call glgentextures(solid_num, textures)

      call camera_update(camera, 90.0)
      
      camera%eye%x = scroll_wheel*cos(camera%dir) +0.01
      camera%eye%z = scroll_wheel*sin(camera%dir) +0.01 
      
      loop: do
            if (sdl_poll_event(event) > 0) then
                  select case (event%type)
                        case (SDL_QUITEVENT)
                              exit loop
                        case (SDL_MOUSEWHEEL)
                              if (event%wheel%y > 0) then 
                                    scroll_wheel = scroll_wheel + MAX(log10(REAL(scroll_wheel)),1.0)
                              else if (event%wheel%y < 0) then 
                                    scroll_wheel = & 
                                    MAX(scroll_wheel - MAX(log10(scroll_wheel),0.01),0.01)
                              end if 
                  end select
            end if
            
            keys(0:) => sdl_get_keyboard_state()
            if (keys(int(SDL_SCANCODE_ESCAPE, kind=1)) == 1) exit loop
            if (keys(int(SDL_SCANCODE_A, kind=1)) == 1) then 
                  angle_yaw = MODULO(angle_yaw + 1.0,360.0)
            else if (keys(int(SDL_SCANCODE_D, kind=1)) == 1) then 
                  angle_yaw = MODULO(angle_yaw - 1.0,360.0)
            else if (keys(int(SDL_SCANCODE_W, kind=1)) == 1) then 
                  angle_roll = MODULO(angle_roll + 1.0,360.0)
            else if (keys(int(SDL_SCANCODE_S, kind=1)) == 1) then 
                  angle_roll = MODULO(angle_roll - 1.0,360.0)
            end if 


            camera%eye%x = scroll_wheel*cos(camera%dir)*2 +0.01
            camera%eye%y = 0.0_8
            camera%eye%z = scroll_wheel*sin(camera%dir)*2 +0.01
          ! if (keys(int(SDL_SCANCODE_A, kind=1)) == 1) then 
            if (INDEX(arg,"stl") /= 0) then 
                  call display_stl(camera,textures,node_num,node_xyz,face_normal,angle_yaw,angle_roll)
            else if (INDEX(arg,"x3d") /= 0) then 
                  DO i = 1, facesetnum
                        ! PRINT *, "draw " , i , "face set "
                        ! PRINT *,  faces_set_array(i)%pointnum ," points"
                        ! PRINT *,  " with point index : ", faces_set_array(i)%points_index(1:10) ," ..."
                        ! PRINT *,  " with coordinate : ", faces_set_array(i)%points_coordinate(:,1) ," ..."
                        ! PRINT *,  " will be convert to  : ", faces_set_array(i)%facenum ," faces"
                        ! PRINT *,  " will be draw with : ", faces_set_array(i)%colornum ," colors"
                        ! PRINT *,  " color sample : ", faces_set_array(i)%color(:,1) 
                        ! PRINT *,  " with color index  : ", faces_set_array(i)%faces_color_index(1:10) 
                        CALL faces_set_array(i)%display(camera,window, textures(i),angle_yaw,angle_roll)
                  END DO
            end if 
          ! end if 
      END DO loop

      if (ALLOCATED(node_xyz))  deallocate(node_xyz)
      if (ALLOCATED(face_node)) deallocate(face_node)
      if (ALLOCATED(face_normal))  deallocate(face_normal)

      do i = 1, size(textures)
            call gldeletetextures(1, textures(i))
      end do
      
      call sdl_gl_delete_context(context)
      call sdl_destroy_window(window)
      call img_quit()
      call sdl_quit()

      contains
      
      subroutine gl_init(screenwidth, screenheight, minz, maxz )

            !! Initialises OpenGL.
            implicit none
            integer, intent(in) :: screenwidth, screenheight
            real(kind=8)        :: aspect
            real(kind=8)        :: maxz ,minz
      
            ! Set drawing region.
            call glviewport(0, 0, screenwidth, screenheight)
      
            ! Set projection matrix.
            call glmatrixmode(GL_PROJECTION)
            call glloadidentity() 
      
            aspect = real(screenwidth, kind=8) / real(screenheight, kind=8)
            ! Alternatively:
            ! call gl_perspective(45.0_8, aspect, 0.1_8, 50.0_8)
            call gluperspective(45.0_8, aspect, minz, maxz)
      
            ! Set model view matrix.
            call glmatrixmode(GL_MODELVIEW)
            call glenable(GL_DEPTH_TEST)
            call glenable(GL_TEXTURE_2D)
      
            call glcullface(GL_BACK)
            call glenable(GL_CULL_FACE)

            ! Set lighting.
            CALL gllightfv(GL_LIGHT0, GL_AMBIENT,[ 0.0, 0.0, 0.0, 1.0 ] )
            CALL gllightfv(GL_LIGHT0, GL_DIFFUSE,[ 1.0, 1.0, 1.0, 1.0 ] )
            CALL gllightfv(GL_LIGHT0, GL_POSITION,[0.0, 3.0, 3.0, 0.0 ] )
            
            ! CALL gllightfv(GL_LIGHT1, GL_AMBIENT,[ 0.0, 0.0, 0.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT1, GL_DIFFUSE,[ 1.0, 1.0, 1.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT1, GL_POSITION,[0.0, 0.0, -1.0, 0.0 ] )

            
            ! CALL gllightfv(GL_LIGHT2, GL_AMBIENT,[ 0.0, 0.0, 0.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT2, GL_DIFFUSE,[ 1.0, 1.0, 1.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT2, GL_POSITION,[0.0, 1.0, 0.0, 0.0 ] )

            ! CALL gllightfv(GL_LIGHT3, GL_AMBIENT,[ 0.0, 0.0, 0.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT3, GL_DIFFUSE,[ 1.0, 1.0, 1.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT3, GL_POSITION,[0.0, -1.0, 0.0, 0.0 ] )

            ! CALL gllightfv(GL_LIGHT4, GL_AMBIENT,[ 0.0, 0.0, 0.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT4, GL_DIFFUSE,[ 1.0, 1.0, 1.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT4, GL_POSITION,[1.0, 0.0, 0.0, 0.0 ] )

            ! CALL gllightfv(GL_LIGHT5, GL_AMBIENT,[ 0.0, 0.0, 0.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT5, GL_DIFFUSE,[ 1.0, 1.0, 1.0, 1.0 ] )
            ! CALL gllightfv(GL_LIGHT5, GL_POSITION,[-1.0, 0.0, 0.0, 0.0 ] )

            call gllightmodelfv(GL_LIGHT_MODEL_AMBIENT, [ 0.2, 0.2, 0.2])
            call gllightmodeli(GL_LIGHT_MODEL_LOCAL_VIEWER, 0)
            call gllightmodeli(GL_LIGHT_MODEL_TWO_SIDE, 1)
            ! call glenable(GL_LIGHT1)
            ! call glenable(GL_LIGHT2)
            ! call glenable(GL_LIGHT3)
            ! call glenable(GL_LIGHT4)
            ! call glenable(GL_LIGHT5)

            call glenable(GL_LIGHTING)
            call glenable(GL_LIGHT0)

            call glenable(GL_AUTO_NORMAL)
            call glenable(GL_NORMALIZE)

            CALL glEnable(GL_COLOR_MATERIAL)
        
            CALL glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
            CALL glShadeModel(GL_SMOOTH)
      
            call glloadidentity()
      
            call glclearcolor(0.8, 0.8, 0.8, 1.0)


            CALL glEnable(GL_LINE_SMOOTH)
            CALL glHint(GL_LINE_SMOOTH_HINT,  GL_NICEST)
      end subroutine gl_init
      
      subroutine display_stl(camera_, textures_,nodenum,nodexyz,facenormal,yaw_angle,roll_angle)
            !! The display_stl routine, called every frame.
            type(camera_type), intent(inout)                 :: camera_
            integer,           intent(inout)                 :: textures_(*)
            integer ( kind = 4 )                             :: nodenum
            real ( kind = 8 ),DIMENSION(:,:)                 :: nodexyz
            real ( kind = 8 ),DIMENSION(:,:)                 :: facenormal
            ! INTEGER                                          :: ii, k
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

            maxx = MAXVAL(nodexyz(1,:))
            maxy = MAXVAL(nodexyz(2,:))
            maxz = MAXVAL(nodexyz(3,:))

            minx = MINVAL(nodexyz(1,:))
            miny = MINVAL(nodexyz(2,:))
            minz = MINVAL(nodexyz(3,:))
      
            call glclear(ior(GL_COLOR_BUFFER_BIT, GL_DEPTH_BUFFER_BIT)) ! Clear the screen and depth buffer.
            call glmatrixmode(GL_MODELVIEW)                             ! Alter model view matrix.
            call glloadidentity()                                       ! Reset current model view matrix.

            ! camera xoay quanh trục y thì tính sin cos cho xz và cho eye%y là 0 ở hàm glulookat
            
            call glulookat(camera_%eye%x, camera_%eye%y, camera_%eye%z, &
            REAL((maxx+minx)*0.5,8), REAL((maxy+miny)*0.5,8), REAL((maxz+minz)*0.5,8), &
                         0.0_8, 0.0_8, 1.0_8)



            CALL glclear(GL_COLOR_BUFFER_BIT)
            call glenable(GL_TEXTURE_2D)


                  call glbindtexture(GL_TEXTURE_2D,textures_(1))


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

                        call glbegin(GL_TRIANGLES)
                              call glcolor3f(0.5, 0.5, 0.5)  
                              kk = 0
                              do ii = 1, nodenum
                               if (MODULO(ii,3) == 1) then 
                                    kk = kk + 1
                              end if 
                               CALL glnormal3f(REAL(facenormal(1,kk)),REAL(facenormal(2,kk)),REAL(facenormal(3,kk)))
                               call glvertex3f(REAL(nodexyz(1,ii)),REAL(nodexyz(2,ii)),REAL(nodexyz(3,ii)) )
                              end do 
                        call glend()

                  ! CALL glpolygonmode(GL_FRONT_AND_BACK ,GL_LINE)
                  ! CALL glGetFloatv(GL_LINE_WIDTH, linewidhth)
                  ! CALL gllinewidth(linewidhth(1)*3)
                  ! call glbegin(GL_TRIANGLES)
                  !       call glcolor3f(0.5, 0.5, 0.5)  
                  !       kk = 0
                  !       do ii = 1, nodenum
                  !             if (MODULO(ii,3) == 1) then 
                  !                   kk = kk + 1
                  !             end if 
                  !             CALL glnormal3f(REAL(facenormal(1,kk)),REAL(facenormal(2,kk)),REAL(facenormal(3,kk)))
                  !             ! CALL gledgeflag(GL_FALSE)
                  !             ! if (edgeflags_lg(ii)) CALL gledgeflag(GL_TRUE)
                  !             call glvertex3f(REAL(nodexyz(1,ii)),REAL(nodexyz(2,ii)),REAL(nodexyz(3,ii)) )
                  !       end do 
                  ! call glend()

                  ! CALL gllinewidth(linewidhth(1))
                  call glpopmatrix()
                  ! angle = MODULO(angle + 5.0 , 360.0)
            call gldisable(GL_TEXTURE_2D)
            
            
            call sdl_gl_swap_window(window)
      end subroutine display_stl

      FUNCTION setedgeflag(nodexyz,nodenum)
            implicit none
            real ( kind = 8 ),DIMENSION(:,:)                :: nodexyz
            INTEGER                                         :: nodenum
            LOGICAL,DIMENSION(nodenum)                      :: setedgeflag
            INTEGER                                         :: ii ,jj
            setedgeflag(:) = .TRUE.
            do ii = 2, node_num
                  DO jj = 1, ii-1 
                  if ((node_xyz(1,ii) == nodexyz(1,jj)).AND.&
                        (node_xyz(2,ii) == nodexyz(2,jj)).AND. &
                        (node_xyz(3,ii) == nodexyz(3,jj))) then
                        setedgeflag(ii) = .FALSE.
                        CYCLE 
                  END IF 
                  END DO 
            END DO 
      END FUNCTION setedgeflag

end program stlread