.ifndef header
        header  = 1
.endif

        SCREEN        = $8000
        NUMCOLS       = 80
        NUMROWS       = 40
        HASATTRIBUTES = 1
        HASASCII      = 0
        HASFEFB       = 0

        .include "godil.inc"
        .include "constants.inc"

.if header
AtmHeader:
        .SEGMENT "HEADER"
        .byte    "OSWRCH80"
        .word    0,0,0,0
        .word    StartAddr
        .word    StartAddr
        .word    EndAddr - StartAddr
.endif

        .SEGMENT "CODE"

StartAddr:
        .include "vga80.inc"
EndAddr:
