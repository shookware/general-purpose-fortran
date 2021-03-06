[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - M_system (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    M_system(3fm) - [M_system]Fortran interface to C system interface

CONTENTS

    Synopsis
    Description
    Environment Access
    File System
    Random Numbers
    C Error Information
    Queries
    Future Directions
    See Also

SYNOPSIS

    Public objects:


       use m_system, only : set_environment_variable, system_unsetenv, &
       system_putenv


       use m_system, only :  system_intenv, system_readenv, system_clearenv


       use M_system, only : system_getcwd, system_link,       &
       system_mkfifo, system_remove, system_rename,           &
       system_umask, system_unlink, fileglob                  &
       system_rmdir, system_chdir, system_mkdir, system_isdir


       use M_system, only :system_errno, system_perror


       use M_system, only :system_getegid, system_geteuid, system_getgid, &
       system_gethostname, system_getpid, system_getppid, system_getsid, &
       system_getuid, system_uname


       use M_system, only : system_kill


       use M_system, only : system_rand, system_srand



DESCRIPTION

    M_system(3fm) is a collection of Fortran procedures that mostly call C or a C wrapper using the ISO_C_BINDING interface to
    access system calls. System calls are special set of functions used by programs to communicate directly with an operating
    system.

    Generally, system calls are slower than normal function calls because when you make a call control is relinquished to the
    operating system to perform the system call. In addition, depending on the nature of the system call, your program may be
    blocked by the OS until the system call has finished, thus making the execution time of your program even longer.

    One rule-of-thumb that should always be followed when calling a system call -- Always check the return value.

ENVIRONMENT ACCESS

          o system_putenv(3f): call putenv(3c)

          o system_unsetenv(3f): call unsetenv(3c) to remove variable from environment

          o set_environment_variable(3f): set environment variable by calling setenv(3c)

          o system_initenv(3f): initialize environment table for reading

          o system_readenv(3f): read next entry from environment table

          o system_clearenv(3f): emulate clearenv(3c) to clear environment

FILE SYSTEM

          o system_chdir(3f): call chdir(3c) to change current directory of a process

          o system_isdir(3f): call fstat(3c) to determine if a filename is a directory

          o system_islink(3f): call lstat(3c) to determine if a filename is a link

          o system_chmod(3f): call chmod(3c) to set file permission mode

          o system_getcwd(3f): call getcwd(3c) to get pathname of current working directory

          o system_getumask(3f): call umask(3c) to get process permission mask

          o system_mkdir(3f): call mkdir(3c) to create empty directory

          o system_mkfifo(3f): call mkfifo(3c) to create a special FIFO file

          o system_remove(3f): call remove(3c) to remove file

          o system_rename(3f): call rename(3c) to change filename

          o system_rmdir(3f): call rmdir(3c) to remove empty directory

          o system_setumask(3f): call umask(3c) to set process permission mask

          o system_link(3f): call link(3c) to remove a filename link

          o system_unlink(3f): call unlink(3c) to create a link to a file

          o fileglob(3f): Returns list of files using a file globbing pattern

RANDOM NUMBERS

       o system_srand(3f): call srand(3c)

       o system_rand(3f): call rand(3c)

C ERROR INFORMATION

         o system_errno(3f): return errno(3c)

         o system_perror(3f): call perror(3c) to display error message

QUERIES

         o system_geteuid(3f): call geteuid(3c)

         o system_getuid(3f): call getuid(3c)

         o system_getegid(3f): call getegid(3c)

         o system_getgid(3f): call getgid(3c)

         o system_getpid(3f): call getpid(3c)

         o system_getppid(3f): call getppid(3c)

         o system_gethostname(3f): get name of current host

         o system_uname(3f): call my_uname(3c) which calls uname(3c)

         o system_getlogin(3f): get login name

FUTURE DIRECTIONS

    A good idea of what system routines are commonly required is to refer to the POSIX binding standards. (Note: IEEE 1003.9-1992
    was withdrawn 6 February 2003.) The IEEE standard covering Fortran 77 POSIX bindings is available online, though currently
    (unfortunately) only from locations with appropriate subscriptions to the IEEE server (e.g., many university networks). For
    those who do have such access, the link is: POSIX Fortran 77 Language Interfaces (IEEE Std 1003.9-1992) (pdf)

SEE ALSO

    Some vendors provide their own way to access POSIX functions and make those available as modules; for instance ...

        o   the IFPORT module of Intel

        o   or the f90_* modules of NAG.

        o   There also some compiler-independent efforts to make them accessible, e.g.

            o  Posix90 (doc),

            o  flibs platform/files and directories,

            o  fortranposix.

-----------------------------------------------------------------------------------------------------------------------------------

                                                           M_system (3)                                               July 02, 2017

Generated by manServer 1.08 from 38ae3b9d-bf72-44f1-b57b-5ce5978af568 using man macros.
                                                            [M_system]
