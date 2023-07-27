
#In this program at first we printed a friendly message to the user with a request to insert a string.
#The program runs with a loop and comparing 2 following chars(i,i+1) by their ASCII code
#and prints a string by the next conditions:
# If the difference is positive, the + character must be copied to the appropriate place in the buf1 area.
# If the difference is negative, the character must be copied - to the appropriate place in buf1
# If the difference is 0 (identical characters), the = character must be copied to the appropriate place in buf1
#At the end the program prints - The string buf1 and the number of times that 2 following chars were equal.


# Data #
.data 
buf : .space 21 #extra byte for null
buf1 : .space 20
s : .word 21  #size for the amount of chars for buf1

# Input/Output  #
FirstText: .asciiz "\nPlease insert a string by length of 20 chars.\n"
SecondText: .asciiz "\nThe OutPut of your string by the program is:\n"
ThirdText: .asciiz "\nThe number of identical char in a row is: "
Tab: .asciiz "\n"


# Text #
.text 
.globl main

#The next code lines are the main part of the program.
#Their mission is to run the program by running with a loop on the string who does the next things:
#A.Checking the ratio between 2 following chars
#B.Counting how many times the times 2 following chars are equal.



main:

move $s0 ,$zero  #Setting a value(0) for index s0
move $s1 ,$zero  # Setting a value(0) for the index s1 who counting the chars
jal storeToBuf

loop:

lb $t1,buf($s0) #Loading t1 = buf(s0)
lb $t2 ,buf+1($s0) #Loading t2 = buf(s0 +1)
la $t3 ,Tab 
beq $t2 ,$zero,endloop #End of size by t2(getting out of bounds or equal to null)
beq $t2 , $t3 , endloop #if t2 is equal to t3 get outside of the loop
bne $t1,$t2 elseIf #if t1 isnt equal to t2 then check other condition
li $t1 , '=' 
sb $t0 , buf($s0)  #Assigning buf(s0) as operator =
addi $s1 , $s1 , 1 # Adding 1 to the s1 counter
j endIf #Jumping to endIf class

else:

li $t0 , '-' # In case of buf(s0) < buf(s0+1)
sb $t0 , buf1($s0) #Storing buf(s0) as operator -
j endIf #Jumping to endIf class

elseIf:

blt $t1 ,$t2 ,else #Checking if buf(s0) < buf(s0 +1) then jump to else
li $t0 , '+'
sb $t0 ,buf1($s0) #Assigning buf1(s0) as operator +
j endIf #Jumping to endIf class

endIf:

addi $s0,$s0,1 #Adding 1 to s0.
j loop

endloop:

sb $zero , buf1($s0) #Finishing the string with null
la $a0 ,SecondText
jal print #print the output
la $a0 , buf1
jal print #printing buf1
la $a0 , ThirdText 
jal print 
move $a0 ,$s1 #Printing how many times 2 following chars are equal
li $v0 , 1
syscall
la $a0 , Tab
jal print
jal exit

exit:

li $v0 , 10
syscall

#Printing up the string
print: 
li $v0 ,4
syscall
jr $ra



# Converting to stack #
#In the next code lines we are building up a stack who stores inside of it the inputed string from the user.
#In the first pharse we build up the stack , in the second is the push action and in the last is the pop action.

storeToBuf:

la $a0 , FirstText
jal print
la $a0 , buf #a0 is in buf address
lw $a1 , s #Assigning the size(20) of a1
li $v0 , 8 #Recieve information from user
syscall
la $a0 ,Tab #Building up a stack
jal print

addi $sp , $sp , -4 #Pushing in values into the stack
sw $ra , ($sp)

lw $ra , ($sp)
addi $sp , $sp ,4 #Pop out values from the stack
jr $ra




