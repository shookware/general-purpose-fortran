[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - month (1)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    month - [TIME] display a calendar

CONTENTS

    Synopsis
    Description
    Options
    Examples

SYNOPSIS

    month [[-year] NNNN] [-month NN|month_name]

DESCRIPTION

    month(1) displays a simple calendar. If no arguments are specified, the current year is displayed.

OPTIONS

             -month Display single month output. The month is numeric (1-12) or a month name or blank. If blank the current month
             is assumed.

             -year NNNN Display a calendar for the whole year NNNN. A year starts on Jan 1st.

             -help Display help text and exit.

             -version Display version information and exit.

EXAMPLES

    month -month 12

           >    December 2015
           >Mo Tu We Th Fr Sa Su
           >    1  2  3  4  5  6
           > 7  8  9 10 11 12 13
           >14 15 16 17 18 19 20
           >21 22 23 24 25 26 27
           >28 29 30 31



    month -month April # month names may be given instead of numbers

-----------------------------------------------------------------------------------------------------------------------------------

                                                             month (1)                                                July 02, 2017

Generated by manServer 1.08 from 31457278-3e93-454f-b404-eafae3c8d231 using man macros.
                                                              [month]
