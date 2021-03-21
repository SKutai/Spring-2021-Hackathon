#Jacob Dunst 
#Lab 4
#CS-274 

	# Start .text segment (program code)
	.text
	
	.globl	main
main:
	
	
# Initialize loop counter, EOL registers and terminating value before loop starts
	

	
	
	
setUpLoop: 

	la $a0,askUser #Load and print string asking for string
        li $v0, 4
        syscall

				## $t0 is where the 
	li $v0,8 		#take in input
        la $a0, writeBuffer 	#load byte space into address
        li $a1, 500 		# allot the byte space for string
        move $t0,$a0 		#save string to t0
        syscall
        

	
	li $t6, '!'	## start line counter at 
	 
	
	la $a0,($t0) #Load and print string asking for string
        li $v0, 4
        syscall
	
	
	
	la $t3, outFile	## we open the string of the name of the outfile 
	li $t2, 'A'
	li $t9, 'Z' 	## -- final character to use
	li $s0, '['
	li $s1, 97
	
	
#############################
fullLoop:

	blt $t2, $s0, saveChar
	bgt $t2, $t9, exit
	blt $t2, $s1, returnLoop
	bgt $t2, $s1, saveChar
	
	
saveChar:

	sb 	$t2, ($t3)		# save the current character as the first character in the name	
			# load char at new index
	
#############################

openWrite:
	
	li   $v0, 13       # system call for open file
	la   $a0, outFile     # output file name
	li   $a1, 1        # Open for writing 
	li   $a2, 0        # mode is ignored
	syscall
	move $s7, $v0      # save the file descriptor 
		
write:	li   $v0, 15
	move $a0, $s7
	la   $a1, writeBuffer
	li   $a2, 2048
	syscall 
	
closeIn2: 
	li $v0, 16
	move $a0,$s6	## closes the read
	syscall
	
	

	
	
returnLoop:

	beq $t2, $t9, exit
	addi 	$t2, $t2, 1
	
	j fullLoop
#########################

	
exit:	li	$v0,10		# exit
	syscall


	# Start .data segment (data!)
	.data

writeBuffer:	.space 10000
askUser:	.asciiz "hey how do you want to crash your computer: "
toWrite:	.asciiz "when i get signed"
outFile:	.asciiz " .txt"
