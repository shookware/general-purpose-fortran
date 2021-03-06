[CLI Home Page]

NAME
    closest_color_name(3f) - [M_color]returns the closest name for the given RGB values.
SYNOPSIS

       subroutine closest_color_name(r,g,b,closestname)

        real,intent(in)               :: r,g,b
        character(len=20),intent(out) :: closestname


DESCRIPTION
    closest_color_name() returns the closest name for the given RGB values. Most X11 Windows color names are supported.
OPTIONS
      + R - red component, range of 0 to 100
      + G - green component, range of 0 to 100
      + B - blue component, range of 0 to 100
            RETURNS
                  @ CLOSESTNAME - name of color found closest to given RGB value
                        EXAMPLE
                            Sample program

                                   program demo_closest_color_name
                                   use M_color, only : closest_color_name
                                   character(len=100) :: string ! at least 20 characters
                                   string=' '

                                   call closest_color_name(100.0,  0.0,  0.0,string)
                                   write(*,*)trim(string)

                                   call closest_color_name(  0.0,100.0,  0.0,string)
                                   write(*,*)trim(string)

                                   call closest_color_name(  0.0,  0.0,100.0,string)
                                   write(*,*)trim(string)

                                   end program demo_closest_color_name

                            Results:
                                   red
                                   green
                                   blue


