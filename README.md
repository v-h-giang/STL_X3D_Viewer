A simple Fortran stl x3d viewer , can view 3D model of any stl or x3d file.

Have 3 open source Fortran library to share here :

     library for X3D 3D model in/out : libX3DIO.f90
     
     library for STL 3D model in/out : libstla_io.f90
     
     Fortran Interface for sdl2 all in one : libsdl2_fortranwraping.f90 

Using : SDL2 , opengl , glu 

ASDW button to rotate , or mouse scroll to zoom in/out

# Compile by MSYS2 : 
(may be need repeat this command 4 times if first time compile in your PC)
gfortran -static-libgfortran -static-libgcc -static-libstdc++ -O3 STL_X3D_viewer.f90 
libX3DIO.f90 libstla_io.f90 libsdl2_fortranwraping.f90 -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer -lWs2_32 -lopengl32 -lglu32 -o STL_X3D_viewer

# How to use (in cmd): 
STL_X3D_viewer sample.X3D 

or 

STL_X3D_viewer sample.stl 

# Example of output
![Sample view ](https://github.com/v-h-giang/STL_X3D_Viewer/blob/main/test.png?raw=true)
