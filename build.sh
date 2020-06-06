#!/bin/bash

for TOP in fpgautils oswrch80 oswrcha0
do

    STEM=`echo $TOP | tr "a-z" "A-Z" | cut -c1-8`
    BIN=${STEM}.BIN
    ATM=${STEM}

    echo building ${ATM}
    ca65 -Dheader=1 -l${TOP}.lst  -o ${TOP}.o ${TOP}.asm
    ld65 ${TOP}.o -o ${ATM} -C ${TOP}.cfg

    echo building ${BIN}
    ca65 -Dheader=0 -l${TOP}.lst  -o ${TOP}.o ${TOP}.asm
    ld65 ${TOP}.o -o ${BIN} -C ${TOP}.cfg

done

# Cleanup
rm -f *.o
