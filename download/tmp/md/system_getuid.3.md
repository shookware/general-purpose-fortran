[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                            Manual Reference Pages  - system_getuid (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    system_getuid(3f) - [M_system]get real UID of current process from Fortran by calling getuid(3c)

CONTENTS

    Synopsis
    Description
    Example

SYNOPSIS

    integer(kind=c_int) function system_getuid()

DESCRIPTION

    The system_getuid(3f) function shall return the real user ID

             of the calling process. The getuid() function shall always be successful and no return value is reserved to indicate
             the error.

EXAMPLE

    Get group ID from Fortran:

       program demo_system_getuid
       use M_system, only: system_getuid
       implicit none
          write(*,*) UID= ,system_getuid()
       end program demo_system_getuid



-----------------------------------------------------------------------------------------------------------------------------------

                                                         system_getuid (3)                                            July 02, 2017

Generated by manServer 1.08 from 56e2738c-0363-46f9-9ed7-35c24d55aab4 using man macros.
                                                           [system_get]
