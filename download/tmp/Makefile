#@(#) Makefile started by makeout(1) 2018-01-06 18:55:52

PROGFILES = PROGRAMS/alphabet.f90 PROGRAMS/asa2pdf.f90 PROGRAMS/base.f90 PROGRAMS/change.f90 PROGRAMS/colors.f90 \
        PROGRAMS/compute.f90 PROGRAMS/cprint.f90 PROGRAMS/days2sec.f90 PROGRAMS/dtu.f90 PROGRAMS/easter.f90 \
        PROGRAMS/exchange.f90 PROGRAMS/factors.f90 PROGRAMS/findll.f90 PROGRAMS/fixedform.f90 PROGRAMS/fseq.f90 \
        PROGRAMS/gcd.f90 PROGRAMS/huegif.f90 PROGRAMS/intrinsics.f90 PROGRAMS/lcm.f90 PROGRAMS/lsup.f90 \
        PROGRAMS/makeout.f90 PROGRAMS/manup.f90 PROGRAMS/month.f90 PROGRAMS/notabs.f90 PROGRAMS/note.f90 \
        PROGRAMS/now.f90 PROGRAMS/numdiff.f90 PROGRAMS/paranoid.f90 PROGRAMS/paws.f90 PROGRAMS/pendulum.f90 \
        PROGRAMS/penv.f90 PROGRAMS/planets.f90 PROGRAMS/quadratic.f90 PROGRAMS/redo.f90 PROGRAMS/rep.f90 \
        PROGRAMS/rever.f90 PROGRAMS/sec2days.f90 PROGRAMS/shell.f90 PROGRAMS/splitname.f90 PROGRAMS/t2m.f90 \
        PROGRAMS/table2html.f90 PROGRAMS/tabulate.f90 PROGRAMS/temp.f90 PROGRAMS/today.f90 PROGRAMS/ttee.f90 \
        PROGRAMS/ufpp.f90 PROGRAMS/what.f90 PROGRAMS/xauth_key.f90 PROGRAMS/_cmp.f90 PROGRAMS/_dirname.f90 \
        PROGRAMS/_echo.f90 PROGRAMS/_false.f90 PROGRAMS/_hostname.f90 PROGRAMS/_kill.f90 PROGRAMS/_ln.f90 \
        PROGRAMS/_logname.f90 PROGRAMS/_ls.f90 PROGRAMS/_mkdir.f90 PROGRAMS/_mkfifo.f90 PROGRAMS/_mv.f90 \
        PROGRAMS/_pwd.f90 PROGRAMS/_rm.f90 PROGRAMS/_rmdir.f90 PROGRAMS/_showumask.f90 PROGRAMS/_sleep.f90 \
        PROGRAMS/_stat.f90 PROGRAMS/_true.f90 PROGRAMS/_tty.f90 PROGRAMS/_uname.f90 PROGRAMS/_unlink.f90 \
        PROGRAMS/_which.f90 PROGRAMS/_yes.f90

PROG = ${PROGFILES:.f90=}

SRCS =  C-gauss.c C-hlsrgb.c C-hvsrgb.c C-jubiglet.c C-jucolor.c  \
     C-macros.c C-M_getkey.c C-M_readline.c C-M_regex.c C-M_system.c C-M_units.c  \
     C-read_line.c C-rgbhls.c C-rgbhvs.c C-rgbmono.c C-rgbval.c c.f90  \
     calc_NC.f90 dparanoia.f90 juown1.f90 M_anyscalar.f90 M_calculator.f90 M_calculator_plus.f90  \
     M_color.f90 M_Compare_Float_Numbers.f90 M_constants.f90 M_csv.f90 M_debug.f90 M_display.f90  \
     M_factor.f90 M_fixedform.f90 M_geography.f90 M_getkey.f90 M_getopt.f90 M_getopt_long.f90  \
     M_history.f90 M_html.f90 M_io.f90 M_journal.f90 M_kracken.f90 M_logic.f90  \
     M_math.f90 M_messages.f90 M_ncurses.f90 M_pixel.f90 M_pixel_slices.f90 M_process.f90  \
     M_random.f90 M_readgif.f90 M_readline.f90 M_regex.f90 M_sort.f90 M_stopwatch.f90  \
     M_strings.f90 M_swap.f90 M_system.f90 M_time.f90 M_treesort.f90 M_units.f90  \
     M_writegif.f90 M_writegif_animated.f90 nc_errmessage.f90 nc_notabs.f90 nc_printescape.f90 nc_printhtml.f90  \
     nc_printplain.f90 nc_printunicode.f90 nc_uniqname.f90 paranoia.f90 pixel_slice.f90 ran_mod.f90  \
     sparanoia.f90 strgar3.f90 

OBJS =  C-gauss.o C-hlsrgb.o C-hvsrgb.o C-jubiglet.o C-jucolor.o  \
     C-macros.o C-M_getkey.o C-M_readline.o C-M_regex.o C-M_system.o C-M_units.o  \
     C-read_line.o C-rgbhls.o C-rgbhvs.o C-rgbmono.o C-rgbval.o c.o  \
     calc_NC.o dparanoia.o juown1.o M_anyscalar.o M_calculator.o M_calculator_plus.o  \
     M_color.o M_Compare_Float_Numbers.o M_constants.o M_csv.o M_debug.o M_display.o  \
     M_factor.o M_fixedform.o M_geography.o M_getkey.o M_getopt.o M_getopt_long.o  \
     M_history.o M_html.o M_io.o M_journal.o M_kracken.o M_logic.o  \
     M_math.o M_messages.o M_ncurses.o M_pixel.o M_pixel_slices.o M_process.o  \
     M_random.o M_readgif.o M_readline.o M_regex.o M_sort.o M_stopwatch.o  \
     M_strings.o M_swap.o M_system.o M_time.o M_treesort.o M_units.o  \
     M_writegif.o M_writegif_animated.o nc_errmessage.o nc_notabs.o nc_printescape.o nc_printhtml.o  \
     nc_printplain.o nc_printunicode.o nc_uniqname.o paranoia.o pixel_slice.o ran_mod.o  \
     sparanoia.o strgar3.o 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# platform-specific values you will probably change
# 
LIBS = -lncurses -lreadline
CC = cc
CFLAGS = -O
FC = f90
FFLAGS = -O
F90 = gfortran
F90FLAGS = -O
LDFLAGS = 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
all: $(PROG)

$(PROG): $(OBJS)

	$(F90) $(LDFLAGS) $@.f90 -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(PROG) $(OBJS) *.mod

.SUFFIXES: $(SUFFIXES) .f90 .F90 .ff .FF .shf
# .shf -- assumed to write Fortran code to stdout when executed
# .FF -- run thru ufpp(1) with    $system directives allowed
# .ff -- run thru ufpp(1) without $system directives allowed

.f90.o:
	$(F90) $(F90FLAGS) -c $<

.F90.o:
	$(F90) $(F90FLAGS) -c $<

.f95.o:
	$(F90) $(F90FLAGS) -c $<

.F95.o:
	$(F90) $(F90FLAGS) -c $<

.f03.o:
	$(F90) $(F90FLAGS) -c $<

.F03.o:
	$(F90) $(F90FLAGS) -c $<
#=================================================================================
# Fortran free format file known to have ufpp(1) preprocessor directives
# run thru ufpp(1) preprocessor with system commands allowed, variable F90 defined
# Assumes .F90 file does not exist previously, as it will overwrite it.
.FF.o:
	@# run thru ufpp(1) preprocessor with system commands allowed
	@[ -x $(*F).F90 ] || echo "error: $(*F).F90 exists"
	ufpp -D F90 OS=`uname -o` -verbose -system .true. -i $(<) -o $(*F).F90
	@[ -s $(*F).F90 ] || echo "error: $(*F).F90 is empty"
	$(F90) $(F90FLAGS) -c $(*F).F90
# clean up scratch files
	@rm -f $(*F).F90 # ${?F:.FF=.o}
#=================================================================================
# Fortran free format file known to have ufpp(1) preprocessor directives
# run thru ufpp(1) preprocessor with no system commands allowed, variable F90
# defined. Assumes .F90 file does not exist previously, as it will overwrite it.
.ff.o:
	@# run thru ufpp(1) preprocessor with system commands allowed
	@[ -x $(*F).F90 ] || echo "error: $(*F).F90 exists"
	ufpp -D F90 OS=`uname -o` -verbose -i $(<) -o $(*F).F90
	@[ -s $(*F).F90 ] || echo "error: $(*F).F90 is empty"
	$(F90) $(F90FLAGS) -c $(*F).F90
# clean up scratch files
	@rm -f $(*F).F90 # ${?F:.ff=.o}
#=================================================================================

calc_NC.o: M_calculator.o M_journal.o M_ncurses.o 
juown1.o: M_calculator.o M_journal.o M_process.o M_strings.o 
M_calculator.o: M_io.o M_journal.o M_math.o M_random.o M_strings.o M_time.o                
M_calculator_plus.o: M_calculator.o M_journal.o 
M_color.o: M_strings.o 
M_csv.o: M_anyscalar.o M_strings.o 
M_factor.o: M_anyscalar.o 
M_fixedform.o: M_ncurses.o 
M_history.o: M_journal.o M_strings.o 
M_html.o: M_journal.o 
M_io.o: M_journal.o M_strings.o 
M_kracken.o: M_debug.o M_journal.o M_strings.o 
M_logic.o: M_calculator_plus.o M_journal.o 
M_math.o: M_anyscalar.o M_journal.o M_sort.o 
M_messages.o: M_anyscalar.o M_journal.o 
M_pixel.o: M_journal.o M_math.o M_sort.o M_units.o 
M_pixel_slices.o: M_pixel.o 
M_regex.o: M_strings.o 
M_sort.o: M_swap.o 
M_stopwatch.o: M_system.o 
M_strings.o: M_journal.o             
M_system.o: M_anyscalar.o M_io.o M_time.o 
M_time.o: M_debug.o M_strings.o          
M_units.o: M_anyscalar.o 
nc_errmessage.o: M_ncurses.o 
nc_notabs.o: M_journal.o 
nc_printescape.o: M_ncurses.o 
nc_printhtml.o: M_ncurses.o 
nc_printplain.o: M_ncurses.o 
nc_printunicode.o: M_ncurses.o 
paranoia.o: M_journal.o 
pixel_slice.o: M_pixel.o M_pixel_slices.o 
strgar3.o: M_calculator.o M_calculator_plus.o M_journal.o 
