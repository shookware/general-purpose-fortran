[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - ibits (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    ibits(3f) - [INTRINSIC:BIT MANIPULATION] Bit extraction

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Standard
    Class
    See Also

SYNTAX

    result = ibits(i, pos, len)

DESCRIPTION

    IBITS extracts a field of length LEN from I, starting from bit position POS and extending left for LEN bits. The result is
    right-justified and the remaining bits are zeroed. The value of pos+len must be less than or equal to the value bit_size(i).

ARGUMENTS

       I - The type shall be INTEGER.

       POS - The type shall be INTEGER.

       LEN - The type shall be INTEGER.

RETURN VALUE

    The return value is of type INTEGER and of the same kind as I.

STANDARD

    [[Fortran 95]] and later

CLASS

    [[Elemental procedure|Elemental function]]

SEE ALSO

    [[bit_size]], [[ibclr]], [[ibset]], [[iand]], [[ior]], [[ieor]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                             ibits (3)                                                July 02, 2017

Generated by manServer 1.08 from a95e6c8b-6b41-4a23-aac2-454e69be86f3 using man macros.
                                                              [ibits]
