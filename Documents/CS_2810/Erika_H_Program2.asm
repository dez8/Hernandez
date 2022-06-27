#Author: Erika Hernandez
#Date: 10/13/21
#Description: Going to print my name and then going to ask for a number and if greater than 10 
#Then it will ask for a string and what ever number you input it will print that string over and over until end of the loop 


.data

#Task 1 -----
name: .asciiz "Erika Hernandez\n" 
title: .asciiz "CS 2810 Program #2\n" 
bye: .asciiz "Bye." 

#task 2 ----
prompt1: .asciiz "Enter a number >= 10: \n" 
bad_num: .asciiz "You enterned a number < 10 \n" 
good_num: .asciiz "You entered a number >= 10 \n" 

#Task 3--- 
prompt_str: .asciiz "Enter your favorite string \n"
text: .space  63 #text, save space for 255 characters, plus the null terminator 



.text 
#Pseudocode: 
#Task 1 ------
#Im going to print my name 
#print the title of program 
#
#Task 2-----Capture number 
#print (prompt_num) 
#capture input number and save it in $s0 
#
#
#Test number 
# if(num < 10) {
#	print(bad_num) 
#	jump to end: label 
# } 
#else {
# print(good_num)
# } 

#Task 3 ---Capture string 
#print(prompt_str) 
#text = readStr()
#
#
#loop $s0 times and print string 
#while ($s0 > 0) {
# print(text) 
# $s0 = $s0 - 1 
# } 

#Bye - Exit - see ya  



#My Name printing 
li $v0, 4 
la $a0, name  
syscall 

#Program title
li $v0, 4 
la $a0, title 
syscall 


#intialize $s1 to 10 
li $s0 10 

#prompt1 - Asking for a number 
la $a0, prompt1
syscall 

#Reading in the int 
li $v0, 5 
syscall 

#moving to $s0 
move $s1, $v0 

#if statement 
#if (num < 10) 
#if (i < j) branch to else 
bge $s1, $s0, else 

#put in a string 4 
li $v0, 4 
la $a0, bad_num
syscall 

j loop 

else: 

#good_num statement and saving 
li $v0, 4
la $a0, good_num
syscall 

#prompt_str Enter your fav 
li $v0, 4 
la $a0, prompt_str
syscall 

#intialize i and limit 
		#i = 0 
li $s2, 1
               # run 63  times limit = 63 
li $a1, 63

#reading the input 
#putting it into a text 
li $v0, 8 
la $a0, text 
syscall 


j loop 

loop: 

#Branch equal = beq
#if it donesnt beq then break out of the loop  
beq $s1, $s2, exitLoop  

#print out text 
li $v0, 4 
la $a0, text 
syscall 

#decreamt i 
subi $s1, $s1, 1 

j loop 
 
exitLoop:  



#bye - see ya-- statement 
li $v0, 4 
la $a0, bye 
syscall 

#Exit 
la $v0, 10 
syscall 