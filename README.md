A simple Fortran stl x3d viewr , can view 3D model of any stl or x3d file.

Using : SDL2 , opengl 

ASDW button to rotate , or mouse scroll to zoom in/out

Compile by MSYS2 : (repeat this command 4 times if first time compile in your PC)

gfortran -static-libgfortran -static-libgcc -static-libstdc++ -O3 STL_X3D_viewer.f90 
libX3DIO.f90 libstla_io.f90 libsdl2_fortranwraping.f90 -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer -lWs2_32 -lopengl32 -lglu32 -o STL_X3D_viewer
