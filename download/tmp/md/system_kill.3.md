[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                             Manual Reference Pages  - system_kill (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    system_kill(3f) - [M_system] send a signal to a process or a group of processes

CONTENTS

    Synopsis
    Description
    Return Value
    Errors
    Example
    See Also

SYNOPSIS

    integer(kind=c_int) function system_kill(pid,sig)


          integer,intent(in) :: pid
          integer,intent(in) :: sig



DESCRIPTION

    The kill() function shall send a signal to a process or a group of processes specified by pid. The signal to be sent is
    specified by sig and is either one from the list given in <signal.h> or 0. If sig is 0 (the null signal), error checking is
    performed but no signal is actually sent. The null signal can be used to check the validity of pid.

    For a process to have permission to send a signal to a process designated by pid, unless the sending process has appropriate
    privileges, the real or effective user ID of the sending process shall match the real or saved set-user-ID of the receiving
    process.

    If pid is greater than 0, sig shall be sent to the process whose process ID is equal to pid.

    If pid is 0, sig shall be sent to all processes (excluding an unspecified set of system processes) whose process group ID is
    equal to the process group ID of the sender, and for which the process has permission to send a signal.

    If pid is -1, sig shall be sent to all processes (excluding an unspecified set of system processes) for which the process has
    permission to send that signal.

    If pid is negative, but not -1, sig shall be sent to all processes (excluding an unspecified set of system processes) whose
    process group ID is equal to the absolute value of pid, and for which the process has permission to send a signal.

    If the value of pid causes sig to be generated for the sending process, and if sig is not blocked for the calling thread and if
    no other thread has sig unblocked or is waiting in a sigwait() function for sig, either sig or at least one pending unblocked
    signal shall be delivered to the sending thread before kill() returns.

    The user ID tests described above shall not be applied when sending SIGCONT to a process that is a member of the same session
    as the sending process.

    An implementation that provides extended security controls may impose further implementation-defined restrictions on the
    sending of signals, including the null signal. In particular, the system may deny the existence of some or all of the processes
    specified by pid.

    The kill() function is successful if the process has permission to send sig to any of the processes specified by pid. If kill()
    fails, no signal shall be sent.

RETURN VALUE

    Upon successful completion, 0 shall be returned. Otherwise, -1 shall be returned and errno set to indicate the error.

ERRORS

    The kill() function shall fail if:

          EINVAL The value of the sig argument is an invalid or unsupported signal number.

          EPERM The process does not have permission to send the signal to any receiving process.

          ESRCH No process or process group can be found corresponding to

                that specified by pid. The following sections are informative.

EXAMPLE

    Sample program:

       program demo_system_kill
       use M_system, only : system_kill
       use M_system, only : system_perror
       implicit none
       integer           :: i,pid,ios,ierr,signal=9
       character(len=80) :: argument


          do i=1,command_argument_count()
             ! get arguments from command line
             call get_command_argument(i, argument)
             ! convert arguments to integers assuming they are PID numbers
             read(argument, (i80) ,iostat=ios) pid
             if(ios.ne.0)then
                write(*,*) bad PID= ,trim(argument)
             else
                write(*,*) kill SIGNAL= ,signal,  PID= ,pid
             ! send signal SIGNAL to pid PID
                ierr=system_kill(pid,signal)
             ! write message if an error was detected
                if(ierr.ne.0)then
                   call system_perror( *demo_system_kill* )
                endif
             endif
          enddo

    end program demo_system_kill

SEE ALSO

    getpid(), raise(), setsid(), sigaction(), sigqueue(),

-----------------------------------------------------------------------------------------------------------------------------------

                                                          system_kill (3)                                             July 02, 2017

Generated by manServer 1.08 from d4861002-75cc-4d6f-8be7-88547e7c11a2 using man macros.
                                                           [system_kil]
