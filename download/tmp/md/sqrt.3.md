[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - sqrt (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    sqrt(3f) - [INTRINSIC:MATHEMATICS] Square-root function

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Standard
    Class

SYNTAX

    result = sqrt(x)

DESCRIPTION

    sqrt(x) computes the square root of X.

ARGUMENTS

       X - The type shall be REAL or COMPLEX.

RETURN VALUE

    The return value is of type REAL or COMPLEX. The kind type parameter is the same as X.

EXAMPLE

    Sample program:

        program test_sqrt
          real(8) :: x = 2.0_8
          complex :: z = (1.0, 2.0)
          x = sqrt(x)
          z = sqrt(z)
        end program test_sqrt



STANDARD

    [[FORTRAN 77]] and later

CLASS

    Elemental function

-----------------------------------------------------------------------------------------------------------------------------------

                                                             sqrt (3)                                                 July 02, 2017

Generated by manServer 1.08 from 01cd09b0-ed5c-4546-a10a-9d05d53d97ae using man macros.
                                                              [sqrt]
