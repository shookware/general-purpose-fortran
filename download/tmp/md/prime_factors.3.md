[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                            Manual Reference Pages  - prime_factors (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    prime_factors - [M_factor]decompose a number into its prime factors

CONTENTS

    Synopsis
    Description
    Options
    Example
    Pedigree

SYNOPSIS

    call prime_factors(number,nprm,iprm,iexp[,verbose])


        integer, intent(in)          :: number
        integer, intent(out)         :: nprm
        integer, intent(out)         :: iprm(:)
        integer, intent(out)         :: iexp(:)
        logical, intent(in),optional :: verbose

DESCRIPTION

    1. Upon return from PRIME_FACTORS,

               NUMBER = IPRM(1)**IEXP(1) * IPRM(2)**IEXP(2) * ...
                        *IPRM(NPRM)**IEXP(NPRM)



    2.    A number represented by a (single-precision) INTEGER value on the VMS VAX cluster can have at most 9 distinct prime
          factors. On machines where the maximum integer is larger than 2**31 - 1, IPRM and IEXP would, in general, have to be
          dimensioned larger since larger numbers may have more than 9 distinct prime factors.

OPTIONS

          NUMBER INTEGER constant or variable, number to be decomposed into prime factors. NUMBER .ge. 2. For 32-bit integers
          NUMBER <= 2147483647

          NPRM INTEGER variable, will contain the number of distinct prime factors of the number.

          IPRM INTEGER array of size at least 9, will contain the prime factors of the number.

          IEXP INTEGER array of size at least 9, will contain the exponents of the corresponding prime factors.

          verbose optional LOGICAL constant or variable, controls printing of results.

          o

          o

EXAMPLE

    Sample program:

       program find_prime_factors
       use M_factor, only : prime_factors
       implicit none
          integer  :: number
          integer  :: iexp(10), iprm(10), nprm
          logical  :: verbose=.true.
          integer  :: ios
          do
            write(*, (a) , advance= no )   Enter number to be factored:  
            read(*,*,iostat=ios,end=999) number
            if(ios.eq.0)then
               call prime_factors(number, nprm, iprm, iexp, verbose)
            endif
          enddo
       999 continue
       end program find_prime_factors





PEDIGREE

    o   Coded at Madison Academic Computing Center, University of Wisconsin, Madison

    o   FORTRAN 77 Version 1988.09

    o   Code converted using TO_F90 by Alan Miller, 2000-07-14T11:42:45

    o   Fortran 2003 version 20160918 by John S. Urban

-----------------------------------------------------------------------------------------------------------------------------------

                                                         prime_factors (3)                                            July 02, 2017

Generated by manServer 1.08 from f332de79-e3ce-4942-887f-f0521edc2b7d using man macros.
                                                           [prime_fact]
