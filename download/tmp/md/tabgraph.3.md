[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - tabgraph (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    tabgraph(3f) - [M_messages]write out a row of numbers and a text-based scaled graph

CONTENTS

    Synopsis
    Description
    Options
    Example
    Notes

SYNOPSIS

    SUBROUTINE tabgraph(ctmp,array,ivals,rmin,rmax,cfill,ilen)

DESCRIPTION

    Given a max and min value for setting up a range write out a series of real numbers with a text-based graph scale appended.
    Each column of numbers is written with a format of "1x,g14.7", taking up 15 characters per number.

    Given an array of numbers in ARRAY(IVALS),

        1.    write the numbers into string CTMP with a scale appended to the right that depicts the relative ranges of the
              numbers.

        2.    RMIN and RMAX are the minimum and maximum numbers to determine where ARRAY(2) thru ARRAY(IVALS) go on the scale
              graph. ARRAY(1) is printed but is not plotted unless IVALS is less than or equal to one (1), on the assumption that
              it is the X values and the other columns are Y values. ABS(IVALS) is the number of numbers in array. Negative numbers
              flag that ARRAY(1) should be plotted too.

        3.    CFILL is the character to fill the scale with as a background character

        4.    ILEN is the number of characters to use for the scale region. If set to 0, it pads out to 132 columns unless the
              scale would be less than 15 characters wide; then it pads out to 255 characters

    Each number takes up 15 columns on output.

    Could stand being made more generic and/or robust. Maybe label max and min values, draw a vertical line at 0 or some reference
    value, check if I/O errors occur many times and stop putting out message (some platforms probably won t like really wide
    lines), and put a marker for values that should be off scale (and so on).

    It is assumed that from this, you can easy make a routine that, given all of curves at once, finds max and min and loops
    calling tabgraph.

OPTIONS

             CC is the string to fill and return with the "graph"

             ARRAY is the list of numbers to put into the graph

             IVALUES0 is the number of numbers in array; if < 2 then take abs(ivalues0) and show first column. Else assume first
             column is X values and should not be added to scale.

             RMIN is the min value for the scale.

             RMAX is the max value for the scale.

             FILL is the character to fill the scale with as a background.

             ILEN0 is the width of the scale in characters. 0=> fit into line of 132 characters unless scale becomes narrower than
             ICMIN characters, then fit into 255 character line.)

EXAMPLE

    Sample program:

           program testit
           character*500 ctmp
           real array(4)
           do 20 i20=1,4
           do 10 i10=1,400
              array(1)=i10*12/100.0
              array(2)=sin(array(1))
              array(3)=cos(array(1))
              if(i20.eq.1)then
                 ! fixed width of 50 for scale
                 call tabgraph(ctmp,array,3,-1.0,1.0,   ,50)
                 ! ctmp  --> CTMP string to fill
                 ! array --> ARRAY data
                 ! 3     --> IVALS
                 !-1     --> RMIN
                 ! 1     --> RMAX
                 !       --> CFILL
                 !50     --> ILEN
              elseif(i20.eq.2)then
                 ! fixed width of 90 for scale with a non-blank fill character
                 call tabgraph(ctmp,array,3,-1.0,1.0, . ,90)
              elseif(i20.eq.3)then
                 ! 0 len auto-sizes scale region
                 call tabgraph(ctmp,array,3,-1.0,1.0,   ,0)
              elseif(i20.eq.4)then
                ! number of values less than or equal to 1
                call tabgraph(ctmp,array,1,0.0,48.0,   ,0)
              endif
              if(i10.eq.1)then
                 ilen=len_trim(ctmp)
                 ilen=max(ilen,1)
              endif
              write(*, (a) )ctmp(1:ilen) ! tabgraph test program
              ! write(*, (i5,a) )i10,ctmp(1:ilen) write with a number count
           10     continue
           20     continue
           end program testit



The purpose of this routine becomes much clearer when looking at a sample output. The third pass thru loop 20 in the test code
above will produce:

  0.1200000      0.1197122      0.9928086    #                                               1                                    2#
  0.2400000      0.2377026      0.9713380    #                                                    1                              2 #
  0.3600000      0.3522742      0.9358968    #                                                        1                        2   #
  0.4800000      0.4617792      0.8869949    #                                                             1                 2     #
  0.6000000      0.5646425      0.8253356    #                                                                 1           2       #
  0.7200000      0.6593847      0.7518057    #                                                                      1  2           #
  0.8400000      0.7446431      0.6674628    #                                                                      2  1           #
  0.9600000      0.8191916      0.5735200    #                                                                  2         1        #
   1.080000      0.8819578      0.4713283    #                                                              2                1     #
   1.200000      0.9320391      0.3623577    #                                                         2                       1   #
   1.320000      0.9687151      0.2481754    #                                                    2                              1 #
   1.440000      0.9914584      0.1304237    #                                               2                                    1#
   1.560000      0.9999417      0.1079617E-01#                                          2                                         1#
   1.680000      0.9940432     -0.1089867    #                                     2                                              1#
   1.800000      0.9738476     -0.2272020    #                                2                                                  1 #
   1.920000      0.9396455     -0.3421496    #                           2                                                     1   #
   2.040000      0.8919287     -0.4521761    #                      2                                                        1     #
   2.160000      0.8313834     -0.5556992    #                  2                                                          1       #
   2.280000      0.7588807     -0.6512296    #              2                                                           1          #
   2.400000      0.6754631     -0.7373938    #          2                                                           1              #
   2.520000      0.5823306     -0.8129520    #       2                                                          1                  #
   2.640000      0.4808225     -0.8768179    #    2                                                         1                      #
   2.760000      0.3723991     -0.9280727    #  2                                                      1                           #
   2.880000      0.2586192     -0.9659793    #2                                                   1                                #
   3.000000      0.1411200     -0.9899925    #2                                              1                                     #
   3.120000      0.2159109E-01 -0.9997669    #2                                         1                                          #
   3.240000     -0.9824860E-01 -0.9951619    #2                                    1                                               #
   3.360000     -0.2166750     -0.9762438    #2                               1                                                    #
   3.480000     -0.3319852     -0.9432846    # 2                         1                                                         #
   3.600000     -0.4425204     -0.8967584    #   2                   1                                                             #
   3.720000     -0.5466911     -0.8373344    #      2           1                                                                  #
   3.840000     -0.6429987     -0.7658673    #         2    1                                                                      #
   3.960000     -0.7300584     -0.6833848    #          1 2                                                                        #
   4.080000     -0.8066177     -0.5910735    #       1        2                                                                    #
   4.200000     -0.8715757     -0.4902610    #    1                2                                                               #
   4.320000     -0.9239982     -0.3823968    #  1                      2                                                           #
   4.440000     -0.9631310     -0.2690330    # 1                            2                                                      #
   4.560000     -0.9884112     -0.1517999    #1                                  2                                                 #
   4.680000     -0.9994755     -0.3238349E-01#1                                       2                                            #
   4.800000     -0.9961646      0.8749917E-01#1                                            2                                       #
   4.920000     -0.9785261      0.2061229    #1                                                 2                                  #
   5.040000     -0.9468138      0.3217820    # 1                                                     2                             #
   5.160000     -0.9014837      0.4328130    #   1                                                        2                        #
   5.280000     -0.8431876      0.5376194    #      1                                                         2                    #
   5.400000     -0.7727644      0.6346930    #         1                                                          2                #
   5.520000     -0.6912268      0.7226379    #            1                                                           2            #
   5.640000     -0.5997474      0.8001894    #                1                                                           2        #
   5.760000     -0.4996417      0.8662322    #                    1                                                         2      #
   5.880000     -0.3923501      0.9198160    #                         1                                                       2   #
   6.000000     -0.2794155      0.9601703    #                              1                                                   2  #
   6.120000     -0.1624621      0.9867148    #                                   1                                               2 #
   6.240000     -0.4317211E-01  0.9990677    #                                        1                                           2#
   6.360000      0.7673930E-01  0.9970512    #                                             1                                      2#
   6.480000      0.1955465      0.9806944    #                                                  1                                2 #
   6.600000      0.3115413      0.9502326    #                                                       1                          2  #
   6.720000      0.4230552      0.9061039    #                                                           1                    2    #
   6.840000      0.5284849      0.8489427    #                                                                1             2      #
   6.960000      0.6263130      0.7795717    #                                                                    1      2         #
   7.080000      0.7151332      0.6989882    #                                                                       21            #
   7.200000      0.7936677      0.6083515    #                                                                   2       1         #
   7.320000      0.8607875      0.5089645    #                                                               2              1      #
   7.440000      0.9155264      0.4022577    #                                                           2                    1    #
   7.560000      0.9570977      0.2897654    #                                                      2                           1  #
   7.680000      0.9849033      0.1731054    #                                                 2                                 1 #
   7.800000      0.9985434      0.5395523E-01#                                            2                                       1#
   7.920000      0.9978216     -0.6597050E-01#                                       2                                            1#
   8.040000      0.9827484     -0.1849474    #                                  2                                                1 #
   8.160000      0.9535407     -0.3012642    #                             2                                                    1  #
   8.280000      0.9106185     -0.4132481    #                        2                                                       1    #
   8.400000      0.8545991     -0.5192883    #                   2                                                          1      #
   8.520000      0.7862877     -0.6178606    #               2                                                           1         #
   8.640000      0.7066678     -0.7075455    #           2                                                            1            #
      :
      :
      :



NOTES

    TABGRAPH makes it very easy to find values in particular ranges in printed output. works particularly well with the once
    ubiquitous fan-fold paper.

-----------------------------------------------------------------------------------------------------------------------------------

                                                           tabgraph (3)                                               July 02, 2017

Generated by manServer 1.08 from d4640267-30c4-4891-8eae-428964ecdebd using man macros.
                                                            [tabgraph]
