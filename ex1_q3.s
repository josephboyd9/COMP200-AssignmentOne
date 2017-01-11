.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:				#entry point of the program

loop:	
	jal 	readswitches	#reads switches, saves pos to $1
	addi	$3, $0, 8	#sets loop counter for "countones" to 8, will count down
	add	$2, $0, $0	#sets number of "1"s to zero
	addi	$5, $0, 1	#sets binary number for ANDing
	jal	countones	#counts downswitches, and returns result in $2
	jal	encrypt
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

	
#so maybe i was wrong last time, but this is such a long way to do this :(
encrypt:
	beqz 	$2, zero
	subi	$2, $2, 1
	beqz	$2, one
	subi	$2, $2, 1
	beqz	$2, two
	subi	$2, $2, 1
	beqz	$2, three
	subi	$2, $2, 1
	beqz	$2, four
	subi	$2, $2, 1
	beqz	$2, five
	subi	$2, $2, 1
	beqz	$2, six
	subi	$2, $2, 1
	beqz	$2, seven
	subi	$2, $2, 1
	beqz	$2, eight

zero:	addi	$2, $2, 0xA
	jr	$ra
one:	addi	$2, $2, 0x7
	jr	$ra
two:	addi	$2, $2, 0x6
	jr	$ra
three:	addi	$2, $2, 0xF
	jr	$ra
four:	addi	$2, $2, 0x2
	jr	$ra
five:	addi	$2, $2, 0x0
	jr	$ra
six:	addi	$2, $2, 0x4
	jr	$ra
seven:	addi	$2, $2, 0xB
	jr	$ra
eight:	addi	$2, $2, 0x3
	jr	$ra

	
