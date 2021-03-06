[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - jucalcx (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    jucalcx(3f) - [M_calculator_plus]return value from a string expression processing messages to simplify call to JUCALC(3f)

CONTENTS

    Synopsis
    Description
    Dependencies
    Examples
    See Also
    References

SYNOPSIS

    subroutine jucalcx(inlin0,outval,outlin0,ierr,ilen)


        character(len=*), intent=(in)  :: inlin0
        doubleprecision, intent=(out)  :: outval
        character(len=*), intent=(out) :: outlin0
        integer, intent=(out)          :: ierr
        integer, intent=(out)          :: ilen



DESCRIPTION

    JUCALCX() takes a string containing a FORTRAN-like expression and evaluates it and returns a numeric or string value as
    appropriate. The main purpose of JUCALCX() is to assume the burden of displaying the calculator messages for codes that make
    multiple calls to JUCALC(). JUCALC () does not display error messages directly.

        o   JUCALCX() calls the calculator routine jucalc.f to evaluate the expressions.

        o   Messages beginning with a # are considered comments and are not passed on to the calculator.

             inlin0 INLIN0 is a string containing a numeric expression. The expression can be up to (iclen_calc=512) characters
             long. The syntax of an expression is as described in the main document of the Calc library. For example:

                   A=sin(3.1416/5) 
                   # this is a comment 
                   $STR("The value is ",40/3) 



             outval OUTVAL is a numeric value calculated from the expression in INLIN0 (when IERR returns 0). When a string value
             is returned (IERR=2) then OUTVAL is the length of the output string.

             outlin0 OUTLIN0 contains a string representation of the number returned in OUTVAL up to 20 characters long when INLIN0
             is a numeric expression. It contains a string up to (iclen_calc=512) characters long when INLIN0 is a string
             expression.

             ierr IERR returns

             o    -1 if an error occurred

             o    0 if a numeric value is returned (value is in OUTVAL, string representation of the value is in OUTLIN2).

             o    1 if no value was returned but a message was displayed (If a  dump or  funcs command was passed to the
                  calculator).

             o    2 if the expression evaluated to a string value instead of a numeric value (value is in OUTLIN0).

             ilen ILEN returns the length of the input string minus trailing blanks.

DEPENDENCIES

    o jucalc

    o pdec

    o User-supplied routines:

            All programs that call the calculator routine must supply their own
            JUOWN1 and C procedures. See the example program for samples.
              o juown1
              o c

EXAMPLES

    Sample program:

        program TEST_JUCALCX
        !     NOTE: user must supply the JUOWN1 and C procedures.
        use m_calculator, only: iclen_calc
        character(len=iclen_calc) ::  outlin0
        doubleprecision :: outval
        call jucalcx( A=3.4**5     ,outval,outlin0,ierr,ilen)
        write(*,*) value of expression is  ,outval
        write(*,*) string representation of value is  ,outlin0
        write(*,*) error flag value is  ,ierr
        write(*,*) length of expression is  ,ilen
        end program TEST_JUCALCX



SEE ALSO

    See also: STRGAR(),RNUM0(),JUCALC(),INUM0(),SNUM0()

REFERENCES

    NONE.

-----------------------------------------------------------------------------------------------------------------------------------

                                                            jucalcx (3)                                               July 02, 2017

Generated by manServer 1.08 from 71800f28-99a0-4568-bad3-8581017522b7 using man macros.
                                                             [jucalcx]
