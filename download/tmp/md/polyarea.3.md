[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - polyarea (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    polyarea(3f) - [M_math:geometry]compute the area bounded by a closed polygonal curve

CONTENTS

    Synopsis
    Description
    Options
    Returns
    Example

SYNOPSIS

    FUNCTION polyarea(x, y) RESULT(fn_val)


          REAL, INTENT(IN)     :: x(:)
          REAL, INTENT(IN)     :: y(:)
          REAL                 :: fn_val



DESCRIPTION

    Given a sequence of points (X(I),Y(I)), polyarea(3f) computes the area bounded by the closed polygonal curve which passes
    through the points in the order that they are indexed. The final point of the curve is assumed to be the first point given.
    Therefore, it need not be listed at the end of X and Y. The curve is not required to be simple ( e.g. It may cross over
    itself).

OPTIONS

RETURNS

EXAMPLE

    Sample program:

       !   (0,10) ########### (10,10)
       !          ##       #
       !          # #     #
       !          #  #   #
       !          #   # #
       !          #    #
       !          #   # #
       !          #  #   #
       !          # #     #
       !          ##       #
       !     (0,0)########### (10,0)


       program demo_polyarea
       use M_math, only : polyarea
       implicit none
       !                          A  B      C    D      E    F
       real,allocatable :: x(:)
       real,allocatable :: y(:)


       x=[ 0.0, 10.0,  0.0,  0.0, 10.0, 0.0]
       y=[10.0, 10.0,  0.0, 10.0,  0.0, 0.0]
       write(*,*) polyarea= ,polyarea(x,y)


       x=[ 0.0,  0.0, 10.0, 10.0,  0.0 ]
       y=[ 0.0, 10.0, 10.0,  0.0,  0.0 ]
       write(*,*) polyarea= ,polyarea(x,y)


       x=[ 0.0, 10.0, 10.0,  0.0,  0.0 ]
       y=[10.0, 10.0,  0.0,  0.0, 10.0 ]
       write(*,*) polyarea= ,polyarea(x,y)


       end program demo_polyarea



-----------------------------------------------------------------------------------------------------------------------------------

                                                           polyarea (3)                                               July 02, 2017

Generated by manServer 1.08 from a0b3a9ce-9743-441d-ad9e-0f2b0a3db89f using man macros.
                                                            [polyarea]
