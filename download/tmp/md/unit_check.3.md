[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                             Manual Reference Pages  - unit_check (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    unit_check - [M_debug]if logical expression is false, call command "goodbad NAME bad" and stop program

CONTENTS

    Synopsis
    Description
    Options
    Examples

SYNOPSIS

    subroutine unit_check(name,expression,message)


        character(len=*),intent(in) :: name
        logical,intent(in) :: expression
        character(len=*),intent(in),optional :: message



DESCRIPTION

    unit_check(3f) tests the expression and if it is false, calls the shell command goodbad NAME bad and stops the program.

OPTIONS

         NAME the unit test name passed onto the goodbad(1) command

         EXPRESSION the logical expression to evaluate

         MESSAGE optional message to display when performing test

EXAMPLES

    Sample program:

        program demo_unit_check
        use M_debug, only: unit_check
        use M_debug, only: unit_check_start, unit_check_good
        implicit none
        integer :: x
        x=10
        call unit_check_start( myroutine )


        call unit_check( myroutine , x.gt.3 , test if big enough )
        call unit_check( myroutine , x.lt.100 , test if small enough )


        write(*,*) checks on "myroutine" passed 
        call unit_check_good( myroutine )


        end program demo_unit_check



    Sample output (varies with what goodbad(1) command is used):

        unit_check_start: myroutine.3 status initialized in database
        unit_check:       myroutine PASSED:test if big enough
        unit_check:       myroutine PASSED:test if small enough
        checks on "myroutine" passed
        data for myroutine.3 is
        entryname    description  documentation  filename  library  ufpp ccall archive date                 status
        -----------  -----------  -------------  --------- -------- ---- ----- ------- -------------------  ----------
        myroutine.3                                                                    2017/02/03 07:23:40  1



-----------------------------------------------------------------------------------------------------------------------------------

                                                          unit_check (3)                                              July 02, 2017

Generated by manServer 1.08 from 0a02a6fc-266c-4118-a60f-ae004aa9e70a using man macros.
                                                           [unit_check]
