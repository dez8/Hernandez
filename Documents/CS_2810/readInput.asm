#Erika Hernandez 
#9/20/2021
#Program 1 
#printing name, then getting total numbers then subtracting by 20 and printing result 


.data
#create labels
#prompt ---to ask the question 
question: .asciiz "Please enter a number:  "
question1: .asciiz "Please enter a second number: "

#store the answer 
number: .word 0 

result: .word 0 

newLine: .asciiz  "\n "

question2: .asciiz "\nThe new difference after subtracting 20 is:  \n"


.text  #body of text---code goes here 


#ask a question 
li $v0, 4 	#set up syscall to print string 
la $a0, question 	#set up argument 
syscall 



#capture the input 
li $v0, 5   #set up syscall to read int 
syscall 

#make a copy of the input-- put in register $s0 
move $s0, $v0 



#ask a question --Asking for a second number 
li $v0, 4 	#set up syscall to print string 
la $a0, question1 	#set up argument 
syscall 



#capture the input 
li $v0, 5   #set up syscall to read int 
syscall 

#here we print total of the adding ---where it messed up 

#lw $t0, number
#lw $t1, number

#add $t2, $t0, $t1

#li $v0, 1 
#move $a0, $t2
#syscall 


#make a copy of the input-- put in register $s0 
move $s0, $v0 

# do some math , add 12 to the value $s0 = s0 + 20
subi $s0, $s0, 20


#store input to mempory store word (sw) source, destination 
sw $s0, number

#retrieve it from mempory laod word (lw) 
lw $t0, number  #load favNum into temp register 


#display prompt2 --printing "The new difference after sub 20 \n" 
li $v0, 4	#set up syscall tp print string 
la $a0, question2  #set up argument 
syscall 



#display again 
li $v0, 1
#move temp reg t0 into argument a0 
move $a0, $t0 
syscall 

	 

#Exit to the program 
li $v0, 10  #set up syscall to exit 
syscall 
