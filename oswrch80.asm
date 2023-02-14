.ifndef header
        header  = 1
.endif

        SCREEN        = $8000
        NUMCOLS       = 80
        NUMROWS       = 40
        HASATTRIBUTES = 0
        HASASCII      = 0
        HASFEFB       = 0
        HASVDU19      = 1

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
        ; this is a bug fix for the BRAN shadow Latch having a random
        ; value on power up. In my case it was 0xBE, which made it think
        ; ROM 14 was in play, causing memory beyond the BRAN workspace
        ; to be corrupted. This memory is used by the OSWRCH driver.
        lda    #0
        sta    $fd
        .include "vga80.inc"
EndAddr:
