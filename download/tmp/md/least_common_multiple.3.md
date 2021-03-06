[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                        Manual Reference Pages  - least_common_multiple (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    least_common_multiple(3f) - [M_factor]Least common multiple of two integers or vector m(:), matrix m(:,:) or cuboid m(:,:,:)

CONTENTS

    Synopsis
    Description
    Example
    Method

SYNOPSIS

    integer function least_common_multiple(i,j)
    integer,intent(in):: i,j
    or
    integer function least_common_multiple(m)
    integer,intent(in):: m(:)
    or
    integer,intent(in):: m(:,:)
    or
    integer,intent(in):: m(:,:,:)

DESCRIPTION

    From Wikipedia, the free encyclopedia:

    In arithmetic and number theory, the least common multiple (also called the lowest common multiple or smallest common multiple)
    of two integers a and b, usually denoted by LCM(a, b), is the smallest positive integer that is divisible by both a and b.
    Since division of integers by zero is undefined, this definition has meaning only if a and b are both different from zero.
    However, some authors define lcm(a,0) as 0 for all a, which is the result of taking the LCM to be the least upper bound in the
    lattice of divisibility.

    The LCM is familiar from grade-school arithmetic as the "lowest common denominator" (LCD) that must be determined before
    fractions can be added, subtracted or compared. The LCM of more than two integers is also well-defined: it is the smallest
    positive integer that is divisible by each of them.

EXAMPLE

    Sample Program:

       program demo_lcm
       use M_factor, only : lcm=>least_common_multiple
       implicit none
          write(*,*) SCALAR: 
             call writeit(10,24,120)
             call writeit(15,30,30)
             call writeit(-15,-30,30)
             call writeit(15,-30,30)
             call writeit(-15,30,30)


          write(*,*) VECTOR: 
             call writeit_v([10,24],120)
             call writeit_v([15,30],30)
             call writeit_v([-15,-30],30)
             call writeit_v([5,-15,-40],120)
             call writeit_v([2,3,4,5],60)
          write(*,*) Special cases: 
             call writeit_v([15,0],0)
             call writeit_v([-15,0],0)
             call writeit_v([0],0)
             call writeit_v([-10],10)
             call writeit_v([22],22)
             call writeit_v([0,0],0)
             call writeit_v([0,0,0,0,0],0)
             call writeit_v([0,0,0,-1,0],0)
             call writeit_v([0,0,0,33,0,3,11],0)
          contains


          subroutine writeit(ii,jj,answer)
          integer,intent(in) :: ii,jj
          integer,intent(in) :: answer
             write(*, ("  For lcm(",I0,",",I0,") the value is ",I0," which is ",L1) )&
                & ii,jj,lcm(ii,jj),lcm(ii,jj).eq.answer
          end subroutine writeit


          subroutine writeit_v(array,answer)
          integer,intent(in) :: array(:)
          integer,intent(in) :: answer
             write(*, ("  For lcm([",*(i0:,1x)) ,advance= no )array
             write(*, ("]) the value is ",i0," which is ",L1) ) &
                & lcm(array),lcm(array).eq.answer
          end subroutine writeit_v


       end program demo_lcm



    Expected results:

        > SCALAR:
        >  For lcm(10,24) the value is 120 which is T
        >  For lcm(15,30) the value is 30 which is T
        >  For lcm(-15,-30) the value is 30 which is T
        >  For lcm(15,-30) the value is 30 which is T
        >  For lcm(-15,30) the value is 30 which is T
        > VECTOR:
        >  For lcm([10 24]) the value is 120 which is T
        >  For lcm([15 30]) the value is 30 which is T
        >  For lcm([-15 -30]) the value is 30 which is T
        >  For lcm([5 -15 -40]) the value is 120 which is T
        >  For lcm([2 3 4 5]) the value is 60 which is T
        > Special cases:
        >  For lcm([15 0]) the value is 0 which is T
        >  For lcm([-15 0]) the value is 0 which is T
        >  For lcm([0]) the value is 0 which is T
        >  For lcm([-10]) the value is 10 which is T
        >  For lcm([22]) the value is 22 which is T
        >  For lcm([0 0]) the value is 0 which is T
        >  For lcm([0 0 0 0 0]) the value is 0 which is T
        >  For lcm([0 0 0 -1 0]) the value is 0 which is T
        >  For lcm([0 0 0 33 0 3 11]) the value is 0 which is T



METHOD

    Reduction by the greatest common divisor

    The following formula reduces the problem of computing the least common multiple to the problem of computing the greatest
    common divisor (GCD), also known as the greatest common factor:

        lcm(a,b) = |a*b| / gcd(a,b)



    This formula is also valid when exactly one of a and b is 0, since gcd(a, 0) = |a|. (However, if both a and b are 0, this
    formula would cause division by zero; lcm(0, 0) = 0 is a special case.

-----------------------------------------------------------------------------------------------------------------------------------

                                                     least_common_multiple (3)                                        July 02, 2017

Generated by manServer 1.08 from a626c524-7715-4b65-800a-9f0f52112ad0 using man macros.
                                                           [least_comm]
