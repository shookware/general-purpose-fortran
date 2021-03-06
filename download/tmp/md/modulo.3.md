[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - modulo (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    modulo(3f) - [INTRINSIC:NUMERIC] Modulo function

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Standard
    Class
    See Also

SYNTAX

    result = modulo(a, p)

DESCRIPTION

    modulo(a,p) computes the A modulo P.

ARGUMENTS

          A - Shall be a scalar of type INTEGER or REAL.

          P - Shall be a scalar of the same type and kind as A. It shall not be zero.

RETURN VALUE

    The type and kind of the result are those of the arguments.

o   If A and P are of type INTEGER: modulo(a,p) has the value of a - floor (real(a) / real(p)) * p.

    o   If A and P are of type REAL: modulo(a,p) has the value of a - floor (a / p) * p.

       The returned value has the same sign as P and a magnitude less than
       the magnitude of P.



EXAMPLE

    Sample program:

       program test_modulo
         print *, modulo(17,3)        ! yields 2
         print *, modulo(17.5,5.5)    ! yields 1.0


         print *, modulo(-17,3)       ! yields 1
         print *, modulo(-17.5,5.5)   ! yields 4.5


         print *, modulo(17,-3)       ! yields -1
         print *, modulo(17.5,-5.5)   ! yields -4.5
       end program



STANDARD

    [[Fortran 95]] and later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    [[mod]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                            modulo (3)                                                July 02, 2017

Generated by manServer 1.08 from 9138d7ab-ae76-46e3-bc19-a85e2201784e using man macros.
                                                             [modulo]
