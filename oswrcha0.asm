.ifndef header
        header  = 1
.endif

        SCREEN        = $A000
        NUMCOLS       = 80
        NUMROWS       = 25
        HASATTRIBUTES = 0
        HASASCII      = 1

        .include "gop.inc"
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
