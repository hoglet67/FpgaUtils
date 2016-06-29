;=================================================================
; Command: FPGAHELP
;
; Outputs the version and command help
;=================================================================

fpgahelp:

		JSR print_name_version
		JSR OSCRLF

		LDX #0
		LDY #0

help1:
		LDA #32
		JSR OSWRCH

help2:
		LDA com_tab,X
		BMI help3
		JSR OSWRCH
		INX
		BNE help2

help3:
		LDA #32
		JSR OSWRCH
		LDA cursor_hpos
		CMP #8
		BNE help3
help4:
		LDA help_tab,Y
	   	BEQ help5
		JSR OSWRCH
		INY
		BNE help4

help5:
		JSR OSCRLF
		INY
		INX
		INX
		LDA com_tab,X
		BPL help1

		RTS
