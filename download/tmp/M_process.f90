!>
!!##NAME
!!    M_process(3fm) - [M_process] Fortran Module for calling process-related C functions from Fortran
!!
!!##SYNOPSIS
!!
!!    use M_process, only : process_open_read, process_open_write, process_close
!!    use M_process, only : process_readline, process_readall, process_writeline
!!    use M_process, only : streampointer, process_debug
!!
!!##DESCRIPTION
!!    Module M_process(3f) lets Fortran code read/write lines from/to processes.
!!
!!    These Fortran procedures use the ISO_C_BINDING interface to define
!!    Fortran-callable versions of the C procedures popen(3c)/pclose(3c)
!!    and fgets(3c)/fputs(3c). A set of record-oriented wrapper routines
!!    are then used to create a simple Fortran-callable interface.
!!
!!    Basically, you
!!
!!    o Open a process for either reading from or writing to using formatted
!!      sequential text records (eg. "lines"); much like with a regular file.
!!    o pass a CHARACTER variable to/from the process that represents
!!      a record.
!!    o Use internal READs and internal WRITEs or parsing routines to
!!      create or interpret the lines.
!!    o when done close the process much like closing a file.
!!
!!    The procedures defined are:
!!
!!     ! open process to read from
!!     subroutine process_open_read(cmd,fp,ierr)
!!
!!     ! open process to write to
!!     subroutine process_open_write(cmd,fp,ierr)
!!
!!     ! read line from process
!!     subroutine process_readline(string,fp,ierr)
!!     ! read all of process output into a string string
!!     function process_readall(cmd,ierr) result (string)
!!
!!     ! write lines to process
!!     subroutine process_writeline(string|string_array,fp,ierr[,trm=.t.|.f.])
!!
!!     ! close process
!!     subroutine process_close(fp,ierr)
!!
!!    where the variable types are
!!
!!       character(len=*)    :: cmd
!!       type(streampointer) :: fp
!!       character(len=*)    :: string
!!       integer             :: ierr
!!
!!##OPTIONS
!!
!!    cmd          command passed to system to start process
!!    fp           C file pointer returned by process_open_*()
!!    string       data line to send or receive from process
!!    ierr         error flag returned. Non-zero indicates an error
!!
!!    maximum character value length is currently 4096
!!
!!##EXAMPLES
!!
!!
!!    An example that places all the output of a command into a single
!!    string variable (see process_readall(3) for an even simpler way to
!!    do this) ...
!!
!!       program read_ex
!!       use M_process ,only: process_open_read, process_readline
!!       use M_process ,only: streampointer, process_close
!!       implicit none
!!       ! C file pointer returned by process_open()
!!       type(streampointer) :: fp
!!       ! check status of calls to process module routines
!!       integer :: ierr
!!       ! hold results, assuming sufficient memory is available
!!       character(len=:),allocatable :: string
!!       ! long enough to hold any expected line
!!       character(len=4096) :: line
!!
!!          string=''
!!
!!          !###! open process to read from
!!          call process_open_read('ls',fp,ierr)
!!
!!          !###! read output of process till end
!!          do
!!             call process_readline(line,fp,ierr)
!!             if(ierr.ne.0)exit
!!             !###! append output lines together
!!             string=string//trim(line)//' '
!!             write(*,*)'['//string//']'
!!          enddo
!!
!!          write(*,*)trim(string)
!!
!!          !###! Wrap up
!!          call process_close(fp,ierr)
!!
!!       end program read_ex
!!
!!    When calling a line-mode program from another program the most natural
!!    way is to open a process and write to it.
!!
!!    Following is an example program that calls the M_process module to
!!    start a plotting program called gnuplot(1) and give it enough commands
!!    to generate a plot. It then lets you interactively interact with the
!!    gnuplot(1) program or continue on in the program.
!!
!!     program gnuplotExample
!!     ! @(#)  Example of Fortran writing GNUPLOT command and data file.
!!     use M_process ,only: process_open_write, process_writeline
!!     use M_process ,only: streampointer, process_close
!!     implicit none
!!     character(len=4096) :: line                             !*! line of data to write (assumed long enough to hold any command line)
!!     type(streampointer) :: fp                               !*! C file pointer returned by process_open()
!!     integer :: ierr                                         !*! check status of calls to process module routines
!!     integer :: i                                            !*! DO loop counter
!!     integer,parameter   :: n=50                             !*! number of points to put into curve to be plotted
!!     real                :: x(n),y(n)                        !*! arrays to fill with curve data to be plotted
!!     integer             :: ios
!!
!!     !*! Define sample X,Y array.
!!     do i=1,n                                                !*! set X() values as whole numbers 1 to N
!!        x(i)=i
!!        !*!
!!        y(i)=(x(i)+0.5)**2
!!     enddo
!!                                                             !*! Write the GnuPlot commands
!!     call process_open_write('gnuplot',fp,ierr)              !*! open process to write to (ie. start gnuplot(1) program)
!!     call process_writeline('$SET1 <<EOD',fp,ierr)           !*! create in-line dataset $SET1
!!     do i=1,n
!!        write(line,'(2(f10.3,1x))')x(i),y(i)                 !*! Write the X,Y array as coordinates to be plotted.
!!        call process_writeline(line,fp,ierr)
!!     enddo
!!
!!     call process_writeline([character(len=128) ::                        &
!!     &'EOD                                                             ', &
!!     &'set title " Example of GNUPlot data and command file generation"', &
!!     &'set nokey'                                                       , &
!!     &'plot $SET1 with lines'                                           , &
!!     &''],fp,ierr)
!!
!!     write(*,'(a)')'enter gnuplot commands or "." to exit'   !*! Additional gnuplot commands; in this case interactively entered
!!     do
!!        write(*,'(a)',advance='no')'gnu>>'
!!        read(*,'(a)',iostat=ios)line
!!        if(line.eq.'.')exit
!!        call process_writeline(trim(line),fp,ierr)
!!     enddo
!!                                                             !*! Wrap up
!!     call process_close(fp,ierr)
!!     write(*,*)'CLOSED THE PROCESS. RETURNING TO PROGRAM'
!!     end program gnuplotExample
!!
!! This program starts a bash shell that, among other things, calls sqlite3 and gnuplot.
!! In this case the text is fixed to keep the example simple. More typically the text
!! would be conditionally selected or generated by the program.
!!
!!     program demo_bash
!!     use M_process ,only : process_open_write, process_writeline
!!     use M_process ,only : streampointer, process_close
!!     implicit none
!!     type(streampointer) :: fp                     ! C file pointer returned by process_open()
!!     integer :: ierr                               ! check status of calls to process module routines
!!     character(len=:),allocatable :: text(:)
!!
!!      !!call process_open_write('cat',fp,ierr)       ! open process to write to (ie. start gnuplot(1) program)
!!        call process_open_write('bash',fp,ierr)       ! open process to write to (ie. start gnuplot(1) program)
!!
!!        text=[character(len=128) :: &
!!     "rm -f sqlite1.db", &
!!     "sqlite3 sqlite1.db <<\EOF", &
!!     "-- *****************************************************************************", &
!!     "CREATE TABLE IF NOT EXISTS animals(", &
!!     "   name        TEXT           NOT NULL   PRIMARY KEY ,", &
!!     "   hair        INT            NOT NULL   ,", &
!!     "   mobility    INT            NOT NULL   ,", &
!!     "   vision      INT            NOT NULL   );", &
!!     "-- *****************************************************************************", &
!!     "INSERT INTO animals ( name, hair, mobility, vision ) VALUES ( 'kittens'  , 4, 5, 1 ) ;", &
!!     "INSERT INTO animals ( name, hair, mobility, vision ) VALUES ( 'mice'     , 6, 7, 2 ) ;", &
!!     "INSERT INTO animals ( name, hair, mobility, vision ) VALUES ( 'rats'     , 2, 3, 3 ) ;", &
!!     "-- *****************************************************************************", &
!!     ".quit", &
!!     "EOF", &
!!     "################################################################################", &
!!     "sqlite3 -header -column sqlite1.db  'select * from animals'", &
!!     "sqlite3 sqlite1.db  'select name, hair, mobility, vision from animals'", &
!!     "################################################################################", &
!!     "gnuplot --persist <<\EOF                                                              ", &
!!     "########################################                                              ", &
!!     "#set terminal gif                                                                     ", &
!!     "#set output 'M_process.3.gif'                                                         ", &
!!     "########################################                                              ", &
!!     "#set terminal png                                                                     ", &
!!     "#set output 'bar.png'                                                                 ", &
!!     "########################################                                              ", &
!!     "#set terminal pdf enhanced                                                            ", &
!!     "#set output 'bar.pdf'                                                                 ", &
!!     "########################################                                              ", &
!!     "#set style data lines                                                                 ", &
!!     "########################################                                              ", &
!!     "set datafile separator ""|""                                                          ", &
!!     "set style data histogram                                                              ", &
!!     "set style histogram cluster gap 1                                                     ", &
!!     "set style fill solid border rgb ""black""                                             ", &
!!     "set auto x                                                                            ", &
!!     "set yrange [0:*]                                                                      ", &
!!     "plot ""< sqlite3 sqlite1.db  'select name, hair, mobility, vision  from animals'"" \  ", &
!!     "      using 2:xtic(1) title ""hair"",  \                                              ", &
!!     "   '' using 4:xtic(1) title ""vision"", \                                             ", &
!!     "   '' using 3:xtic(1) title ""mobility""                                              ", &
!!     "quit                                                                                  ", &
!!     "EOF                                                                                   ", &
!!     ""]
!!
!!        !!write(*,'(a)')text
!!        call process_writeline(text,fp,ierr)
!!        call process_close(fp,ierr)
!!        write(*,'(a)')'CLOSED THE PROCESS. RETURNING TO PROGRAM'
!!
!!     end program demo_bash
!!
!!##SEE ALSO
!!
!!       o PIPES: pipe(3c), popen(3c), pclose(3c), fflush(3c)
!!       o NAMED PIPES: mkfifo(3c), mknod(3c)
!!       o SUBPROCESSES: fork(3c)
!!       o OTHER: fflush(3c)
!===================================================================================================================================
!>
!! DESCRIPTION: record-oriented Fortran I/O interface to C procedures popen/pclose and fgets/fputs and process-related procedures
!!##VERSION:     2.0.0, 20161105
!! AUTHOR:      John S. Urban
!===================================================================================================================================
!-==================================================================================================================================
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()!
!-==================================================================================================================================
! 2013/02/23  - John S. Urban

module M_process
! only: c_int, c_char, c_null_char, c_associated, c_ptr, c_null_ptr, c_new_line
use, intrinsic :: ISO_C_BINDING
implicit none
character(len=*),parameter :: ident="@(#)M_process(3fm): call C process open,close,read,write functions "

PRIVATE
PUBLIC  ::  process_open_read  ! (cmd,fp,ierr)                  ! open process to read from
PUBLIC  ::  process_open_write ! (cmd,fp,ierr)                  ! open process to write to
PUBLIC  ::  process_close      ! (fp,ierr)                      ! close process
PUBLIC  ::  process_readline   ! (string,fp,ierr)               ! read line from process
PUBLIC  ::  process_readall    ! (cmd,ierr) result(string)      ! read all lines from process
PUBLIC  ::  process_writeline  ! (string,fp,ierr)               ! write line to process
PRIVATE ::  process_open       ! (fp,ierr)                      ! open process

logical, PUBLIC ::  process_debug=.false.

type, public       :: streampointer
   type (c_ptr)    :: handle = c_null_ptr
end type streampointer


interface process_writeline
   module procedure process_writeline_scalar, process_writeline_array
end interface

!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
! popen
interface
   function system_popen(path, mode) bind(C, name='popen')
      use, intrinsic :: ISO_C_BINDING
      character(kind=c_char), dimension(*) :: path, mode
      type (c_ptr) :: system_popen
   end function
end interface
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!    fgets(3fp) - get character string from a file or stream by calling fgets(3c)
!!##SYNOPSIS
!!
!!    #include <stdio.h>
!!    char *fgets(char *BUF, int N, FILE *FP);
!!##DESCRIPTION
!!    Reads at most N-1 characters from FP until a newline is found. The
!!    characters including to the newline are stored in BUF. The buffer
!!    is terminated with a 0.
!!##RETURNS
!!    fgets(3c) returns the buffer passed to it, with the data filled
!!    in. If end of file occurs with some data already accumulated, the
!!    data is returned with no other indication. If no data are read,
!!    NULL is returned instead.
!!##PORTABILITY
!!    Note that fgets(3c) returns all of the data, including the newline.
!===================================================================================================================================
! fgets
interface
   function system_fgets(buf, siz, handle) bind(C, name='fgets')
      use, intrinsic :: ISO_C_BINDING
      type (c_ptr) :: system_fgets
      character(kind=c_char), dimension(*) :: buf
      integer(kind=c_int), value :: siz
      type (c_ptr), value :: handle
   end function
end interface
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
! pclose
interface
   function system_pclose(handle) bind(C, name='pclose')
      use, intrinsic :: ISO_C_BINDING
      integer(c_int) :: system_pclose
      type (c_ptr), value :: handle
   end function
end interface
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!        fputs(3fp) - write a character string in a file or stream
!!##SYNOPSIS
!!
!!        #include <stdio.h>
!!        int fputs(const char *S, FILE *FP);
!!##DESCRIPTION
!!        `fputs'  writes  the string at S (but without the trailing null) to the
!!        file or stream identified by FP.
!!##RETURNS
!!        If successful, the result is `0'; otherwise, the result is `EOF'.
!!##PORTABILITY
!!        ANSI  C  requires `fputs', but does not specify that the result on
!!        success must be `0'; any non-negative value is permitted.
!===================================================================================================================================
interface
   function system_fputs(buf, handle) bind(C, name='fputs')
   use, intrinsic :: ISO_C_BINDING
      integer(c_int) :: system_fputs
      character(kind=c_char), dimension(*) :: buf
      type (c_ptr), value :: handle
   end function
end interface
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!        fflush(3fp) - flush buffered file output
!!##SYNOPSIS
!!
!!      Syntax:
!!
!!       #include <stdio.h>
!!       int fflush(FILE *FP);
!!##DESCRIPTION
!!      The `stdio' output functions can buffer output before delivering it to
!!      the host system, in order to minimize the overhead of system calls.
!!
!!      Use `fflush' to deliver any such pending output (for the file or
!!      stream identified by FP) to the host system.
!!
!!      If FP is `NULL', `fflush' delivers pending output from all open
!!      files.
!!
!!      Additionally, if FP is a seekable input stream visiting a
!!      file descriptor, set the position of the file descriptor to
!!      match next unread byte, useful for obeying POSIX semantics when
!!      ending a process without consuming all input from the stream.
!!##RETURNS
!!        fflush returns '0' unless it encounters a write error; in that
!!        situation, it returns `EOF'.
!!##PORTABILITY
!!        ANSI C requires `fflush'.  The behavior on input streams is only
!!        specified by POSIX, and not all implementations follow POSIX rules.
!!
!!        No supporting OS subroutines are required.
!===================================================================================================================================
interface
   function fflush(handle) bind(C, name='fflush')
   use, intrinsic :: ISO_C_BINDING
      integer(c_int) :: fflush
      type (c_ptr), value :: handle
   end function
end interface
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
contains
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!##SYNOPSIS
!!
!!##DESCRIPTION
!!##EXAMPLE
!!
!===================================================================================================================================
subroutine process_open_read(cmd,fp,ierr)
character(len=*),parameter :: ident="@(#)M_process::process_open_read(3f):open process to read from"

   character(len=*),intent(in)     :: cmd  ! shell command to start process with
   type(streampointer),intent(out) :: fp           ! file pointer returned for process
   integer,intent(out)             :: ierr         ! status for attempt to open process (0= no error)

   character(len=3),parameter      :: mode='r'     ! read/write mode parameter to pass to popen(3c)
!-----------------------------------------------------------------------------------------------------------------------------------
   ierr=0
   call process_open(cmd,mode,fp,ierr)

end subroutine process_open_read
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!##SYNOPSIS
!!
!!##DESCRIPTION
!!##EXAMPLE
!!
!===================================================================================================================================
subroutine process_open_write(cmd,fp,ierr)
character(len=*),parameter :: ident="@(#)M_process::process_open_write(3f):open process to write to"

   character(len=*),intent(in)     :: cmd  ! shell command to start process with
   type(streampointer),intent(out) :: fp           ! file pointer returned for process
   integer,intent(out)             :: ierr         ! status for attempt to open process (0= no error)
   character(len=3),parameter      :: mode='w'     ! read/write mode parameter to pass to popen(3c)
!-----------------------------------------------------------------------------------------------------------------------------------
   ierr=0
   call process_open(cmd,mode,fp,ierr)

end subroutine process_open_write
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!##SYNOPSIS
!!
!!##DESCRIPTION
!!##EXAMPLE
!!
!===================================================================================================================================
subroutine process_open(cmd,mode,fp,ierr)
character(len=*),parameter :: ident="@(#)M_process::process_open(3fp):open process"

   character(len=*),intent(in)     :: cmd  ! shell command to start process with
   character(len=*),intent(in)     :: mode         ! read/write/mode parameter to pass to popen(3c)
   type(streampointer),intent(out) :: fp           ! file pointer returned for process
   integer,intent(out)             :: ierr         ! status for attempt to open process (0= no error)
!-----------------------------------------------------------------------------------------------------------------------------------
   ierr=0
   fp%handle = system_popen(trim(cmd) // C_NULL_CHAR, trim(mode) // C_NULL_CHAR)

   if (.not.c_associated(fp%handle)) then
      write(*,*) '*process_open_write* ERROR: Could not open pipe!'
      ierr=-1
   else
      if(process_debug)then
         write(*,*) '*process_open_write* Opened pipe successfully'
      endif
   end if

end subroutine process_open
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!##SYNOPSIS
!!
!!##DESCRIPTION
!!##EXAMPLE
!!
!===================================================================================================================================
subroutine process_close(fp,ierr)
character(len=*),parameter :: ident="@(#)M_process::process_close(3f):close process"
   ! DO NOT MAKE fp INTENT(IN)
   type(streampointer) :: fp           ! file pointer returned for process
   integer(c_int) ::  ios
   integer :: ierr
!-----------------------------------------------------------------------------------------------------------------------------------
   ierr=fflush(fp%handle)
   ios=0

   if (.not.c_associated(fp%handle)) then
      write(*,*)'*process_close* process not found'
   else
      ios=system_pclose(fp%handle)
   endif

   if(process_debug)then
      write(*,*) '*process_close* Closed pipe with status ',ios
   endif

   ierr=min(-1_c_int,ios)

end subroutine process_close
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!##SYNOPSIS
!!
!!##DESCRIPTION
!!##EXAMPLE
!!
!===================================================================================================================================
subroutine process_readline(readfrom,fp,ierr)
character(len=*),parameter :: ident="@(#)M_process::process_readline(3f):read line from process"
!  readfrom must be at least two
   character(len=*),intent(out)   :: readfrom
   type(streampointer),intent(in) :: fp
   integer,intent(out)            :: ierr

   integer (kind=c_int) :: clen
   integer :: eos, i
   integer :: ios
!-----------------------------------------------------------------------------------------------------------------------------------
   clen=len(readfrom)-1
   readfrom=' '

   do while (c_associated(system_fgets(readfrom, clen, fp%handle)))
      eos=2
      do i=1, clen
         if (readfrom(i:i) == C_NULL_CHAR) then
            eos=i-2  ! assuming line terminator character and line string terminator should not be printed
            readfrom(eos+1:)=' '
            exit
         end if
      end do
      if(process_debug)then
         write(*,*) eos, ': "', trim(readfrom(1:eos)), '"'
      endif
      ierr=0
      return
   end do

   ios=0
   !!ios = system_pclose(fp%handle)
   !!if(process_debug)then
   !!   write(*,*) '*process_readline* Closed pipe with status ',ios
   !!endif
   ierr=min(-1,ios)

end subroutine process_readline
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!       process_readall(3f) - [M_process] read all lines from process into single string
!!##SYNOPSIS
!!
!!       syntax:
!!
!!        function process_readall(cmd,delim,ierr)  result(string)
!!        character(len=*),intent(in)              :: cmd
!!        character(len=*),intent(in),optional     :: delim
!!        integer,intent(out)                      :: ierr
!!        character(len=:),allocatable             :: string
!!##OPTIONS
!!       cmd               command to pass to system
!!       delim             delimiter to place between output lines when they
!!                         are concatenated. Defaults to a space
!!       ierr              check status of calls to process module routines
!!##RESULTS
!!       process_readall   Assuming sufficient memory is available all the output of the
!!                         system command are concatenated into a string with
!!                         spaces added between the output lines of the command.
!!##EXAMPLE
!!
!!
!!  Read all output of a command to a single string
!!
!!   program test_process_readall
!!   use M_process ,only: process_readall
!!   implicit none
!!   integer :: ierr
!!   character(len=:),allocatable :: string
!!   string=process_readall('ls',ierr=ierr)
!!   write(*,*)ierr,string
!!   end program test_process_readall
!!
!!  Read all output of a command to an array using split(3f)
!!
!!    program test_process_readall
!!    use M_process ,only: process_readall
!!    use M_strings ,only: split
!!    implicit none
!!    integer                      :: ierr
!!    integer                      :: i
!!    character(len=:),allocatable :: string
!!    !character(len=:),allocatable :: array(:)
!!    character(len=256),allocatable :: array(:)
!!       string=process_readall('ls',delim=NEW_LINE("A"),ierr=ierr)
!!       call split(string,array,delimiters=NEW_LINE("A"))
!!       do i=1,size(array)
!!          write(*,'(i0,t10,"[",a,"]")')i,trim(array(i))
!!       enddo
!!    end program test_process_readall
!!   Results:
!!
!!    1   [Articles]
!!    2   [LIBRARY]
!!    3   [PC]
!!    4   [SHIP]
!!    5   [SPEC]
!!    6   [crib.dat]
!!    7   [doc]
!!    8   [html]
!!    9   [index.html]
!!    10  [plan.txt]
!!    11  [questions]
!!    12  [scripts]
!!    13  [tmp]
!!
!!##SEE ALSO
!!       M_process(3fm)
!===================================================================================================================================
function process_readall(cmd,delim,ierr)  result(string)      !! not hardened
character(len=*),parameter     :: ident="@(#)M_process::process_readall(3f):read all lines from process"
character(len=*),intent(in)              :: cmd
character(len=:),allocatable             :: string      !! assume will not run out of memory
integer,intent(out),optional             :: ierr
character(len=*),intent(in),optional     :: delim
character(len=:),allocatable             :: delim_local
   integer                               :: ierr_local(3), ierr_read
   integer                               :: i
   type(streampointer)                   :: fp
   character(len=4096)                   :: line        !! assumed long enough
!-----------------------------------------------------------------------------------------------------------------------------------
   if(present(delim))then
      delim_local=delim
   else
      delim_local=' '
   endif

   !! change to stream I/O so do not have to have arbitrary line length limit, or at least make length an option
   string=''
   ierr_local(:)=0
   call process_open_read(cmd,fp,ierr_local(1))  ! start command

   if(ierr_local(1).eq.0)then
      do
         call process_readline(line,fp,ierr_read)  ! read line from command output
         if(ierr_read.ne.0)then
            exit
         endif
         string=string//trim(line)//delim_local
      enddo
      string=trim(string)
   endif

   call process_close(fp,ierr_local(3)) ! Wrap up

   if(present(ierr))then
      do i=1,size(ierr_local)
         if(ierr_local(i).ne.0)then
            ierr=ierr_local(i)
            exit
         endif
      enddo
   elseif(any(ierr_local.ne.0))then
      !!write(*,*)'*M_process::process_readall(3f)* error values=',ierr_local
      stop
   endif

end function process_readall
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
!>
!!##NAME
!!##SYNOPSIS
!!
!!##DESCRIPTION
!!##EXAMPLE
!!
!===================================================================================================================================
subroutine process_writeline_scalar(writefrom,fp,ierr,trm)
character(len=*),parameter :: ident="@(#)M_process::process_writeline_scalar(3fp):write line to process"
character(len=*),intent(in)    :: writefrom
type(streampointer),intent(in) :: fp
integer,intent(out)            :: ierr
logical,intent(in),optional    :: trm
   integer                     :: ios
   logical                     :: trm_local
!-----------------------------------------------------------------------------------------------------------------------------------
   if(present(trm))then
      trm_local=trm
   else
      trm_local=.true.
   endif
!-----------------------------------------------------------------------------------------------------------------------------------
   if(trm_local)then
      ierr=system_fputs(trim(writefrom)//C_NEW_LINE//C_NULL_CHAR,fp%handle)
   else
      ierr=system_fputs(writefrom//C_NEW_LINE//C_NULL_CHAR,fp%handle)
   endif
   if(ierr.ne.0)then
      ios = system_pclose(fp%handle)
      if(process_debug)then
         write(*,*) '*process_writeline_scalar* Closed pipe with status ',ios
      endif
      ierr=min(-1,ios)
   endif
   if(ierr.eq.0)then
      ierr=fflush(fp%handle)
   endif

end subroutine process_writeline_scalar
subroutine process_writeline_array(writefrom,fp,ierr)
character(len=*),parameter :: ident="@(#)M_process::process_writeline_array(3fp):write lines to process"
character(len=*),intent(in)    :: writefrom(:)
type(streampointer),intent(in) :: fp
integer,intent(out)            :: ierr
   integer                     :: i
!-----------------------------------------------------------------------------------------------------------------------------------

   ierr=0
   do i=1,size(writefrom,dim=1)
      call process_writeline_scalar(writefrom(i),fp,ierr)
      if(ierr.ne.0)exit
   enddo

end subroutine process_writeline_array
!-----------------------------------------------------------------------------------------------------------------------------------
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()-
!-----------------------------------------------------------------------------------------------------------------------------------
end module M_process
!-==================================================================================================================================
!()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()()!
!-==================================================================================================================================
