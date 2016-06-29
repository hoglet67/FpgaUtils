#!/bin/bash

ROM=fpgautils
ROMBIN=FPGAUTIL.BIN
ROMATM=FPGAUTIL

STANDALONE=oswrch80
STANDALONEBIN=OSWRCH80.BIN
STANDALONEATM=OSWRCH80

# Build Fpgautils ROM
echo building ${ROMATM}
ca65 -Dheader=1 -l${ROM}.lst  -o ${ROM}.o ${ROM}.asm 
ld65 ${ROM}.o -o ${ROMATM} -C ${ROM}.cfg 

echo building ${ROMBIN}
ca65 -Dheader=0 -l${ROM}.lst  -o ${ROM}.o ${ROM}.asm 
ld65 ${ROM}.o -o ${ROMBIN} -C ${ROM}.cfg 

# Build standalone OSWRCH80
echo building ${STANDALONEATM}
ca65 -Dheader=1 -l${STANDALONE}.lst -o ${STANDALONE}.o ${STANDALONE}.asm
ld65 ${STANDALONE}.o -o ${STANDALONEATM} -C ${STANDALONE}.cfg 

echo building ${STANDALONEBIN}
ca65 -Dheader=0 -l${STANDALONE}.lst -o ${STANDALONE}.o ${STANDALONE}.asm
ld65 ${STANDALONE}.o -o ${STANDALONEBIN} -C ${STANDALONE}.cfg 

# Cleanup
rm -f *.o

