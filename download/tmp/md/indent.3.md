[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - indent (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    indent - [M_strings]count number of leading spaces in a string

CONTENTS

    Synopsis
    Description
    Examples

SYNOPSIS

    function indent(line)


        integer                        :: indent
        character(len=*),intent(in)    :: line



DESCRIPTION

    Count number of leading spaces in a CHARACTER variable.

EXAMPLES

    Sample Program:

        program demo_indent
        !  test filter to count leading spaces in a character variable
        !  might want to call notabs(3f) to expand tab characters
        use M_strings, only : indent
        implicit none
        character(len=1024) :: in
        integer             :: ios
           READFILE: do
              read(*, (A) ,iostat=ios)in
              if(ios /= 0) exit READFILE
              write(*, (i3,"",a) )indent(in),trim(in)
           enddo READFILE
        end program demo_indent



-----------------------------------------------------------------------------------------------------------------------------------

                                                            indent (3)                                                July 02, 2017

Generated by manServer 1.08 from 0768decb-34e5-40f6-978c-c5778a8c418d using man macros.
                                                             [indent]
