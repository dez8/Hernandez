# Author: Erika Hernandez 
# Date: 12/9/2021
# Description: 	learn about nested procedures - 


.data 

#string constants 

hello: .asciiz "\nInside hello procedure \n" 
hola: .asciiz "\nInside hola procedures \n" 
name: .asciiz "\nhello pedro" 
done: .asciiz "\nhave a great xams break!!" 


.text 
	la $a0, name 
	jal hello_proc
	
	#la $a0, name 
	#jal hola_proc 
	
	
	li $v0, 4 
	la $a0, done 
	syscall 	#print done 


end: 
	li $v0, 10 #exit 
	syscall 
	
	
	
############################################################
#print hello string + name string 
#	
# $a0 -- input, name string 
# use $s0 for the input parameter (requried) 
hello_proc:  


	#only one register that stores the return address ($ra) 
	#getting overwritten when jumping to hola_proc 
	#save registers to the stack 
	
	subu $sp, $sp, 32 
	sw $ra, 28($sp)		#frame size = 32 (begin allocation ) 
	sw $fp, 24($sp) 	#preserver the return address (required) 
	sw $s0, 20($sp) 	#preserve $s0 (ifn needed ) 
	
	addu $fp, $sp, 32 	#move frame prointer to base frame ( end allocation) 


	move $s0, $a0 #set the return value 
	
	#print Hello string 
	li $v0, 4 
	la $a0, hello
	syscall 
	
	
	
	#print name 
	li $v0, 4 
	la $a0, name
	syscall 
	
	
	#call the hola_proc
	move $a0, $s0 #copy the address of the input parameters
	jal hola_proc 	#jump to hola_proc 
	
	# $ra is being set to the address of line 59 
	#when we juump back, $ra contains line 59 
	#line 69 jumps to line 59 
	#any time you have a procedure calling a procedure, must do this. 


end_hello_proc: 


	#return from the procedure 
	#restore the value of $ra 
	

	lw $ra, 28($sp)		#frame size = 32 (begin allocation ) 
	lw $fp, 24($sp) 	#preserver the return address (required) 
	lw $s0, 20($sp) 	#preserve $s0 (ifn needed ) 
	
	addu $sp, $sp, 32 	#move frame prointer to base frame ( end allocation) 

	jr $ra 

############################################################
#print hola string + name string 
#	
# $a0 -- input, name string 
# use $s0 for the input parameter (requried) 
hola_proc:  

	move $s0, $a0 #set the return value 
	
	#print Hello string 
	li $v0, 4 
	la $a0, hola
	syscall 
	
	
	
	#print name 
	li $v0, 4 
	la $a0, name
	syscall 

end_hola_proc: 


	#return from the procedure 
	jr $ra  







