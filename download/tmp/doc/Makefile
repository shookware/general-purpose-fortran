# DOING SOMETHING WRONG
################################################################################
SOURCES  = $(wildcard *.man)
OUTFILES = $(patsubst %.man,../tmp/man/man3/%.gz,$(SOURCES))
CMD = txt2man
.SUFFIXES: $(SUFFIXES) .man .gz
all: $(OUTFILES)
	echo "SOURCES $(SOURCES)"
	echo "OUTFILES $(OUTFILES)"
	echo made $@ : $^
	cd ../tmp/man; mandb -c `pwd`
man.gz:
	@echo 'XXXX $(CMD) $< |gzip - > ${@}'
	#$(CMD) $< |gzip - > ${@}
################################################################################
#INFILES = $(wildcard *.3.man)
#OUTFILES = $(patsubst %.man,../tmp/man/man3/%.gz,$(INFILES))
#gz.man:
#	@echo rule1
#	$(CMD) $< |gzip - > ${@}
#%.gz: %.man
#	@echo rule
#	$(CMD) $< |gzip - > ${@}
################################################################################
#MY_DOC := ../tmp/man
#
#MAN1 := $(wildcard $(MY_DOC)/man[1-8]/*.gz)
#
#all: $(MAN1:%.gz=%.1.man) $(MAN3:%.gz=%.3) $(MAN5:%.gz=%.5) $(MAN7:%.gz=%.7)
#
#%.1.man %.2 %.3 %.4 %.5 %.6 %.7 %.8 : %.md
#	@ronn --roff $?
################################################################################
$(OUTFILES): $(SOURCES)
#      For the target lib(member.o) and the .s2.a rule, the internal macros
#      are defined as follows:
#	@echo "$<  member.s2"
#	@echo "$*  member"
#	@echo "$@  lib"
#	@echo "$?  member.s2"
#	@echo "$%  member.o"
#      When the $?
#      macro contains more than one prerequisite file name, the $(?D) and
#      $(?F) (or ${?D} and ${?F}) macros expand to a list of directory name
#      parts and file name parts respectively.
#	@echo "A ${?D}"
#	@echo "B ${?F}"
#	@echo "C $(?D)"
#	@echo "D $(?F)"
#	@echo "E INFILES $(INFILES)"
#	@echo "F OUTFILES $(OUTFILES)"
# 
#	@printf " lt:$<\n star:$*\n at:$@\n question:$?\n amp:$&\n percent:$%\n"
#	$(CMD) $< |gzip - > ${@}
	$(CMD) `basename ${@} .gz`.man |gzip - > ${@}
#-------------------------------------------------------------------------------
