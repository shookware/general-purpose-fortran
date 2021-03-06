#!/bin/bash
################################################################################
#@(#) run makemake(1) to make Makefile for this collection
banner makemakefile.sh
################################################################################
MAKEMAKEFILE(){
#  create basic makefile for plain .f90 files that compose libGPF.a
#  and create a compressed archive file for simple downloads on the
#  Internet
(
cd tmp
    SANI='fsanitize=address,null,undefined'
    SANI=
env MAKEMAKE_LDFLAGS="-fno-range-check -Wall -fbounds-check -g -I. -J. $SANI" \
    MAKEMAKE_F90FLAGS="-Wall -Wuninitialized -fbounds-check -fno-range-check -g -I. -J. $SANI" \
    MAKEMAKE_F90='gfortran' \
    MAKEMAKE_LIBS='-lncurses -lreadline' \

    makemake "`find PROGRAMS -type f -name '*.[fF] -name '[fF]90'|xargs`"

mv Makefile Makefile_picky
env MAKEMAKE_F90='gfortran' \
    MAKEMAKE_LIBS='-lncurses -lreadline' \

    makemake "`find PROGRAMS -type f -name '*.[fF] -name '*.[fF]90'|xargs`"
)
}
################################################################################
MAKEOUT(){
(
cd tmp
    SANI='fsanitize=address,null,undefined'
    SANI=
env LDFLAGS="-fno-range-check -Wall -fbounds-check -g -I. -J. $SANI" \
    F90FLAGS="-Wall -Wuninitialized -fbounds-check -fno-range-check -g -I. -J. $SANI" \
    F90='gfortran' \
    LIBS='-lncurses -lreadline' \
    makeout "`find PROGRAMS -type f|xargs`" -o

mv Makefile Makefile_picky
env F90='gfortran' \
    LIBS='-lncurses -lreadline' \
    makeout "`find PROGRAMS -type f|xargs`" -o
)
}
################################################################################
if inpath makeout
then
   MAKEOUT
else
   MAKEMAKEFILE
fi
################################################################################
exit
################################################################################
