[UP]

-----------------------------------------------------------------------------------------------------------------------------------
                                               Manual Reference Pages  - change (1)
-----------------------------------------------------------------------------------------------------------------------------------
                                                                 
NAME

    change(1f) - replace old fixed string with new fixed string in filenames

CONTENTS

    Synopsis
    Description
    Options
    Example

SYNOPSIS

    change c/old/new/ FILENAMES [-dryrun][-cmd COMMAND]| --version| --help

DESCRIPTION

    Given a change directive and a list of filenames replace all occurrences of the original string with the new string.

OPTIONS

          c/old/new/ change occurrences of old string to new string in filenames

          FILENAMES names of files to rename

          -dryrun write the commands to stdout instead of executing them

          -cmd COMMAND change command from "mv" to specified command name

          --help display this help and exit

          --version output version information and exit

EXAMPLE

    # change all files with .f90 in their name to .F90

       change c/.f90/.F90/ *.f90

       change c@/usr/bin/@/bin/@ /usr/bin/*

-----------------------------------------------------------------------------------------------------------------------------------

                                                            change (1)                                                July 02, 2017

Generated by manServer 1.08 from a085f4af-b067-4eff-9482-6d3c2b751911 using man macros.
                                                             [change]
