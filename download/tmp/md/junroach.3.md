[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - junroach (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    junroach(3f) - [M_messages]print an eye-catching image of a roach.

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS

    SUBROUTINE junroach(where)


        integer,intent(in) :: where



DESCRIPTION

    Prints an eye-catching image of a roach. Typically used to mark an error has occurred in an output file.

OPTIONS

             where the I/O flag to pass on to JOURNAL(). To write to stdout use  s . See the description of JOURNAL() for a meaning
             for the I/O flag.

EXAMPLE

    Typical Usage:

         program demo_junroach
         use M_messages, only : junroach
         implicit none
         logical :: error=.true.
            if (error)then
               write(*,*) ERROR: 
               call junroach( s )
               write(*,*)    explanation of error. 
            endif
         end program demo_junroach



    Results:

        >ERROR:
        >      ,--.     .--.
        >     /    \. ./    \
        >    /  /\ / " \ /\  \
        >   / _/  {~~v~~}  \_ \
        >  /     {   |   }     \
        > ;   /\{    |    }/\   \
        > | _/  {    |    }  \_  :
        > |     {    |    }      |
        > |    /{    |    }\     |
        > |   / {    |    } \    |
        > |  /  {    |    }  \   |
        > |  \  \    |    /  /   |
        > |   \  \   |   /  /    |
        >  \   \  \  |  /  /    /
        >   \  /   ~~~~~   \   /
        >   explanation of error.



-----------------------------------------------------------------------------------------------------------------------------------

                                                           junroach (3)                                               July 02, 2017

Generated by manServer 1.08 from 56104680-1128-45ca-b34e-3a8eea4e7841 using man macros.
                                                            [junroach]
