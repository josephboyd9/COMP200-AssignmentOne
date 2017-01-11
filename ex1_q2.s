.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:				#entry point of the program

loop:	
	jal 	readswitches	#reads switches, saves pos to $1
	addi	$3, $0, 8	#sets loop counter for "countones" to 8, will count down
	add	$2, $0, $0	#sets number of "1"s to zero
	addi	$5, $0, 1	#sets binary number for ANDing
	jal	countones	#counts downswitches, and returns result in $2
	jal	writessd	#displays first 8 digits of $2 in hex

	j 	loop		#loops back to the start


#I'm sure there is a simpler way to do this, but I can't find it...
countones:
	subi	$3, $3, 1	#increments the loop counter down by one
	and	$6, $1, $5	#ANDs switches to find pos of nth switch
	multi	$5, $5, 2	#moves binary num one digit left
	
	bnez	$6, increment	#if downswitch was found, increments counter
	bnez	$3, countones	#jumps back to previous subroutine after 8 loops
	jr	$ra		#return to loop from subroutine

#adds one to downswitch counter
increment:
	addi	$2, $2, 1	#adds one to downswitch counter
	bnez	$3, countones	#checks next switch to the left
	jr	$ra		#end subroutine
