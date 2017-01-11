.text				#specifies that what follows are instructions
.global main			#specifies that the label "main" is globally accessible

main:				#entry point of the program

loop:	
	jal readswitches	#reads switches, saves pos to $1
	add $2, $1, $0		#copies word in $1 to $2
	jal writessd		#displays first 8 digits of $2 in hex

	j loop			#loops back to the start
	