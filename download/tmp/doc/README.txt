   This section uses $FILTER NULL|COMMENT|HELP|VERSION ... to let a block
   of text be included in the source that is essentially ignored. The
   difference between this and a $IFDEF .FALSE. ... $ENDIF or $OUTPUT
   /dev/null .. $OUTPUT END section is that the -file switch lets this
   section get written to a file optionally when the $UFPP_DOCUMENT_DIR
   variable is set. This text could be markdown text, HTML, RTF, LaTex
   or some other format to be post-processed independently.

   The $FILTER HELP section directives is converted into the
   HELP_USAGE() subroutine by ufpp. Optionally if the environment variable
   $UFPP_DOCUMENT_DIR is set the text is additionally written as-is into

      $UFPP_DOCUMENT_DIR/doc/cf.1.man

   because the optional "-file cf.1.man" switch was specified.

   This additional file would then typically be run thru txt2man(1) to
   create a man(1) page.

   $DOCUMENT HELP -f example.3.man
   NAME
   SYNOPSIS
   DESCRIPTION
   OPTIONS
   OUTPUT
   EXAMPLES
   $DOCUMENT END
