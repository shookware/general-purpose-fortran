[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - achar (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    ACHAR(3f) - [INTRINSIC:CHARACTER] returns a character in a specified position in the ASCII collating sequence

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Example
    Note
    Standard
    Class
    See Also

SYNTAX

    result = ACHAR(I [, KIND])

DESCRIPTION

    ACHAR(I) returns the character located at position I in the ASCII collating sequence.

ARGUMENTS

           I - the type shall be INTEGER.

           KIND - (optional) an INTEGER initialization expression indicating the kind parameter of the result.

RETURN VALUE

    The return value is of type CHARACTER with a length of one. If the KIND argument is present, the return value is of the
    specified kind and of the default kind otherwise.

EXAMPLE

    Sample program:

        program test_achar
          character c
          c = achar(32)
        end program test_achar



NOTE

    see [[ichar]] for a discussion of converting between numerical values and formatted string representations.

STANDARD

    [[FORTRAN 77]] and later, with KIND argument Fortran 2003 and later

CLASS

    Elemental function

SEE ALSO

    [[char]], [[iachar]], [[ichar]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             achar (3)                                                July 02, 2017

Generated by manServer 1.08 from 774c1635-e717-4f25-b676-8da725a2c89b using man macros.
                                                              [achar]
