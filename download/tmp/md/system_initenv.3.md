[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                           Manual Reference Pages  - system_initenv (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    system_initenv(3f) - [M_system]initialize environment table pointer and size so table can be read by readenv(3f)

CONTENTS

    Synopsis
    Description
    Example

SYNOPSIS

    subroutine system_initenv()

DESCRIPTION

    A simple interface allows reading the environment variable table of the process. Call system_initenv(3f) to initialize reading
    the environment table, then call system_readenv(3f) until a blank line is returned. If more than one thread reads the
    environment or the environment is changed while being read the results are undefined.

EXAMPLE

    Sample program:

       program demo_system_initenv
       use M_system, only : system_initenv, system_readenv
       character(len=:),allocatable :: string
          call system_initenv()
          do
             string=system_readenv()
             if(string.eq.  )then
                exit
             else
                write(*, (a) )string
             endif
          enddo
       end program demo_system_initenv



    Sample results:

       USERDOMAIN_ROAMINGPROFILE=buzz
       HOMEPATH=\Users\JSU
       APPDATA=C:\Users\JSU\AppData\Roaming
       MANPATH=/home/urbanjs/V600/LIBRARY/libjust4/download/tmp/man:/home/urbanjs/V600/doc/man:::
       DISPLAYNUM=0
       ProgramW6432=C:\Program Files
       HOSTNAME=buzz
       XKEYSYMDB=/usr/share/X11/XKeysymDB
       PUBLISH_CMD=
       OnlineServices=Online Services
            :
            :
            :

-----------------------------------------------------------------------------------------------------------------------------------

                                                        system_initenv (3)                                            July 02, 2017

Generated by manServer 1.08 from a8ce4808-339e-4029-99f1-ac44ba8b258d using man macros.
                                                           [system_ini]
