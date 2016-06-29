.ifndef header
        header  = 1
.endif
        
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

