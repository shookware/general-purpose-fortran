[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                             Manual Reference Pages  - merge_bits (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    merge_bits(3f) - [INTRINSIC:BIT MANIPULATION] Merge of bits under mask

CONTENTS

    Syntax
    Description
    Arguments
    Return Value
    Standard
    Class

SYNTAX

    result = merge_bits(i, j, mask)

DESCRIPTION

    merge_bits(i, j, mask) merges the bits of I and J as determined by the mask. The k-th bit of the result is equal to the k-th
    bit of I if the k-th bit of MASK is 1; it is equal to the k-th bit of J otherwise.

ARGUMENTS

         I - Shall be of type INTEGER.

         J - Shall be of type INTEGER and of the same kind as I.

         MASK - Shall be of type INTEGER and of the same kind as I.

RETURN VALUE

    The result is of the same type and kind as I.

STANDARD

    [[Fortran 2008]] and later

CLASS

    [[Elemental function]]

-----------------------------------------------------------------------------------------------------------------------------------

                                                          merge_bits (3)                                              July 02, 2017

Generated by manServer 1.08 from 99f00042-e032-4c9d-ac3e-62bcc0eb6684 using man macros.
                                                           [merge_bits]
