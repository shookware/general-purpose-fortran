[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                       Manual Reference Pages  - M_Compare_Float_Numbers (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    M_Compare_Float_Numbers - [M_Compare_Float_Numbers]perform relational comparisons on real numbers

CONTENTS

    Purpose
    Category
    Language
    Calling Sequence
    Modules
    Contains
    Include Files
    Externals
    Common Blocks
    Creation History

PURPOSE

    Module containing routines to perform equality and relational comparisons on floating point numbers.

CATEGORY

    Utility

LANGUAGE

    Fortran-95

CALLING SEQUENCE

    USE M_Compare_Float_Numbers

MODULES

          Type_Kinds: Module containing definitions for kinds of variable types.

CONTAINS


            .EqualTo. Relational operator to test the equality of floating point numbers.


            .GreaterThan. Relational operator to test if one operand is greater than another.


            .LessThan. Relational operator to test if one operand is less than another.

            Compare_Float: Function to compare floating point scalars and arrays with adjustable precision tolerance.

INCLUDE FILES

    None.

EXTERNALS

    None.

COMMON BLOCKS

    None.

CREATION HISTORY

          Written by: Paul van Delst, CIMSS/SSEC 01-Apr-2003 paul.vandelst@ssec.wisc.edu

          Copyright: (C) 2003 Paul van Delst

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.


    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

-----------------------------------------------------------------------------------------------------------------------------------

                                                    M_Compare_Float_Numbers (3)                                       July 02, 2017

Generated by manServer 1.08 from 33e901bc-b76f-4590-a37a-9176a4146d54 using man macros.
                                                           [M_Compare_]
