[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                           Manual Reference Pages  - meters_to_feet (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    meters_to_feet - [M_units]converts a measurement in meters to feet

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS

    elemental real function meters_to_feet(meters)


        class(*),intent(in) :: meters

DESCRIPTION

    Converts feet to meters using the formula:

        feet= meters/12.0/0.0254

OPTIONS

             feet any standard scalar value supported by anyscalar_to_real(3f). This at least includes REAL, INTEGER, and
             DOUBLEPRECISION.

EXAMPLE

    Sample program

       program meters_to_feet_demo
       use M_units, only : meters_to_feet
       implicit none
          write(*,*) With REAL array input     , meters_to_feet([ -1.0, 0.0, 1.0 ])
          write(*,*) With INTEGER array input  , meters_to_feet([ -1,   0,   1   ])
          write(*,*) With DOUBLEPRECISION      , meters_to_feet(-1.0d0),meters_to_feet(0.0d0),meters_to_feet(1.0d0)
       end program meters_to_feet_demo



    Results

        With REAL array input      -3.28083992       0.00000000       3.28083992
        With INTEGER array input   -3.28083992       0.00000000       3.28083992
        With DOUBLEPRECISION       -3.28083992       0.00000000       3.28083992



-----------------------------------------------------------------------------------------------------------------------------------

                                                        meters_to_feet (3)                                            July 02, 2017

Generated by manServer 1.08 from 1d9ccc3d-d295-4428-a9db-88663c1e7656 using man macros.
                                                           [meters_to_]
