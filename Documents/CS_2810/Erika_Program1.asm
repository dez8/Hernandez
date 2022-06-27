#Erika Hernandez 
#9/20/2021
#Desciption: Program #1 


#data segment
.data 

#labels for Task 1 
name: .asciiz "Erika Hernandez \n"
hw: .asciiz "Programming Assignment #1 \n"
info: .asciiz "A program that subtracts two numbers \n" 
newLine: .asciiz "\n"

#labels for Task 2 
question1: .asciiz "Please enter a number: \n"
question2: .asciiz "Please enter a second number: \n"
total: .asciiz "The difference is: \n"

#labels for Task 3
new: .asciiz "The new difference after substracting 20 is: \n"



#text segment - Awesome code below 
.text 

#This prints my name 
li $v0, 4 
la $a0, name
syscall 

#NewLine- Space 
li $v0, 4 
la $a0, newLine
syscall 

#This prints the assignment label 
li $v0, 4 
la $a0, hw
syscall 

#NewLine- Space 
li $v0, 4 
la $a0, newLine
syscall 

#This prints the information 
li $v0, 4 
la $a0, info
syscall 

#NewLine - space 
li $v0, 4 
la $a0, newLine
syscall 


#Tasks 2 -------- 
#Asking for the first number 
 

li $v0, 5	
syscall 

move $v0, $t1 

#Asking for the second number 
li $v0, 4 
la $a0, question2
syscall 


li $v0, 5 
syscall 

move $v0, $t2 


#subtract the numbers 
sub $t1, $t1, $t2




#The total is --This prints out the sentence----the difference is 
li $v0, 4 
la $a0, total
syscall 


#PRINT the results 
li $v0,1 	#set uup system to print integer this subtracts  
move $a0, $t3 
syscall 


li $v0, 4
la $a0, newLine 
syscall 

#Tasks 3-------- 
#new statement--- The new diffrence 
li $v0, 4 
la $a0, new
syscall


# do some math , add 12 to the value $s0 = s0 + 12 
subi $t3 $t2, 20


#display the answer 
li $v0, 1	#set up syscall to print int 
la $a0,($t3)	 #set up arguement 
syscall 




#exit 
li $v0, 10
syscall 