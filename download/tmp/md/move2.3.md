[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                                Manual Reference Pages  - move2 (3)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    move2(3f) - [M_pixel] change current position

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS

    definition:


       subroutine move2(x, y)
       real x, y



DESCRIPTION

    Update current position.

OPTIONS

      X new X position

      Y new Y position

EXAMPLE

    Sample program:

         program demo_move2
         use M_pixel, only : prefsize, vinit, ortho2, clear
         use M_pixel, only : move2, draw2, vexit
         use M_pixel, only : P_pixel,P_colormap
         use M_writegif, only : writegif
         call prefsize(60,40)
         call vinit()
         call ortho2(-300.0,300.0,-200.0,200.0)
         call clear(0)
         call move2(-300.0,-200.0)
         call draw2(300.0,200.0)
         call move2(300.0,-200.0)
         call draw2(-300.0,200.0)
         call writegif( move2.3.gif ,P_pixel,P_colormap)
         call vexit()
         end program demo_move2

-----------------------------------------------------------------------------------------------------------------------------------

                                                             move2 (3)                                                July 02, 2017

Generated by manServer 1.08 from ad705807-a4bb-438c-88b8-a64cb501b5a6 using man macros.
                                                              [move2]
