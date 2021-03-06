[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                 Manual Reference Pages  - mod (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    mod(3f) - [INTRINSIC:NUMERIC] Remainder function

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

    result = mod(a, p)

DESCRIPTION

    mod(a,p) computes the remainder of the division of A by P.

ARGUMENTS

          A - Shall be a scalar of type INTEGER or REAL.

          P - Shall be a scalar of the same type and kind as A and not equal to zero.

RETURN VALUE

    The return value is the result of a - (int(a/p) * p). The type and kind of the return value is the same as that of the
    arguments. The returned value has the same sign as A and a magnitude less than the magnitude of P.

EXAMPLE

    Sample program:

       program test_mod
         print *, mod(17,3)         ! yields 2
         print *, mod(17.5,5.5)     ! yields 1.0
         print *, mod(17.5d0,5.5)   ! yields 1.0d0
         print *, mod(17.5,5.5d0)   ! yields 1.0d0


         print *, mod(-17,3)        ! yields -2
         print *, mod(-17.5,5.5)    ! yields -1.0
         print *, mod(-17.5d0,5.5)  ! yields -1.0d0
         print *, mod(-17.5,5.5d0)  ! yields -1.0d0


         print *, mod(17,-3)        ! yields 2
         print *, mod(17.5,-5.5)    ! yields 1.0
         print *, mod(17.5d0,-5.5)  ! yields 1.0d0
         print *, mod(17.5,-5.5d0)  ! yields 1.0d0
       end program test_mod



STANDARD

    [[FORTRAN 77]] and later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    [[modulo]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                              mod (3)                                                 July 02, 2017

Generated by manServer 1.08 from fe0ac900-af6a-42ce-8499-9189add9c69e using man macros.
                                                               [mod]
