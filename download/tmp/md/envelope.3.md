[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                              Manual Reference Pages  - envelope (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    envelope(3f) - [M_math:geometry]Find the vertices (in clockwise order) of a polygon enclosing the points (x(i), y(i), i=1, ...,
    n.

CONTENTS

    Synopsis
    Description
    Options
    Returns
    Example

SYNOPSIS

    subroutine envelope(x, y, n, vertex, nvert)


        integer,intent(in) :: n
        real,intent(in)    :: x(n), y(n)
        integer :: vertex(n), nvert



DESCRIPTION

    Given the points composing a polygon find the points required to draw an envelope of the polygon

OPTIONS

        x,y the vectors describing the polygon

        n the number of elements in the input vectors

RETURNS

         vertex the number of the vertices needed to generate the envelope

         nvert number of vertices returned

EXAMPLE

-----------------------------------------------------------------------------------------------------------------------------------

                                                           envelope (3)                                               July 02, 2017

Generated by manServer 1.08 from 6b56fb23-dee3-4837-8aac-d4edb0950867 using man macros.
                                                            [envelope]
