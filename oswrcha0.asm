.ifndef header
        header  = 1
.endif

        SCREEN        = $A800
        NUMCOLS       = 80
        NUMROWS       = 25
        HASATTRIBUTES = 0
        HASASCII      = 1
        HASFEFB       = 0

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
        jmp   init
        jmp   vga80
init:
        ;; Interrupt handler
        bit   $b001
        bvc   skip_init
        jmp   $e000     ;; Initialize AtoMMC, never returns; IRQs will be disabled ;-(
skip_init:
        pla
        rti

        .include "vga80.inc"
EndAddr:
