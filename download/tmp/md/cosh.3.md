[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - cosh (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    cosh(3f) - [INTRINSIC:TRIGONOMETRIC] Hyperbolic cosine function

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

    x = cosh(x)

DESCRIPTION

    cosh(x) computes the hyperbolic cosine of X.

ARGUMENTS

       X - The type shall be REAL or COMPLEX.

RETURN VALUE

    The return value has same type and kind as X. If X is complex, the imaginary part of the result is in radians. If X is REAL,
    the return value has a lower bound of one, cosh(x) >= 1.

EXAMPLE

    Sample program:

       program test_cosh
         real(8) :: x = 1.0_8
         x = cosh(x)
       end program test_cosh



STANDARD

    [[FORTRAN 77]] and later, for a complex argument [[Fortran 2008]] or later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    Inverse function: [[acosh]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             cosh (3)                                                 July 02, 2017

Generated by manServer 1.08 from 55cd11a8-7acf-482c-9d6d-ad997c5fa339 using man macros.
                                                              [cosh]
