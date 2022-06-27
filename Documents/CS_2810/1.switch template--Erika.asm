# Author: Erika Hernandez 
# Date: 12/9/2021
# Description: 	Print out the properties of a one digit number. 
#		Example of a switch block

# Pseudocode: 
#
#	print(prompt)
#	n = readInt()
#
#	switch(n) {
#	   case 0:
#	      print "n is zero"
#	      break
#	   case 4:
#	      print "n is even"
#	      break
#	   case 1:
#	   case 9:
#	      print "n is square"
#	      break
#	   case 2:
#	      print "n is even"
#	      break
#	   case 3:
#	   case 5:
#	   case 7:
#	      print "n is prime"
#	      break
#	   case 6:
#	   case 8:
#	      print "n is even"
#	      break
#	   default:
#	      print "out of range"
#
#	} # end switch
#
# Registers: n = $t0

.macro print_str(%string)
	la $a0, %string 
	#li $v0, 4 
	syscall 
.end_macro



.data 

# string constants
prompt: .asciiz "Enter a one digit number: "
zero: 	.asciiz "n is zero\n "
even: 	.asciiz "n is even\n "
square: .asciiz "n is square\n "
prime: 	.asciiz "n is prime\n "
bad: 	.asciiz "out of range\n"

# switch block jump table
 
# 		0*4  	1*4  2*4    3*4     4*4	  5*4	  6*4	7*4	8*4  
switch: .word case0, case1, case2, case3, case4, case5, case6, case7, case8, case9



.text

	#print prompt 
	li $v0 4, 
	la $a0, prompt 
	syscall 
	
	
	#read the int 
	li $v0 5, 
	syscall 
	move $t0, $v0 
	#move $v0 into $0 
	
	#li $v0, 4 #set for call 

	blt $t0, 0, default     #if n < 0 go to default 
	bgt $t0, 9, default    # if n > 9 go to default 

	mul $t1, $t0, 4 
	
	lw $t1, switch($t1) 	 #temp = switch(temp) 
	jr $t1  	#jump to the address in temp 
	

case0: 
	la $a0, zero 
	syscall 	#print zero 
	
	j end 

case4: 
	print_str(even)	#call print_str(even)
	j end 

case1: 

case9: 
	print_str(square)	#call print_str(even)
	j end 

case2: 
	print_str(even)	#call print_str(even)
	j end 

case3: 

case5:
 
case7: 

case6: 
	

case8: 
	print_str(even)	#call print_str(even)
	j end 



default: 
	#li $v0, 4 #print screen prompt 
	la $a0, bad 
	syscall 
	
	

end: 	li $v0, 10	#exit
	syscall




