#Simple integer calculator written in MIPS

.data
hello: .asciiz "Hello! Welcome to the Calculator!\n\n"
num1: .asciiz "Please provide the first number: "
num2: .asciiz "Please provide the second number: "
addition: .asciiz "\nThe sum of your numbers is: "
division: .asciiz "\nThe quotient of your numbers is: "
subtraction: .asciiz "\nThe difference of your numbers is: "
multiplication: .asciiz "\nThe product of your numbers is: "

.text
addi $v0, $zero, 4
la $a0, hello
syscall	

addi $v0, $zero, 4
la $a0, num1
syscall	

addi $v0, $zero, 5
syscall
move $t1, $v0

addi $v0, $zero, 4
la $a0, num2
syscall	

addi $v0, $zero, 5
syscall
move $t2, $v0

div $s1, $t1, $t2
mul $s2, $t1, $t2
add $s3, $t1, $t2
sub $s4, $t1, $t2

addi $v0, $zero, 4
la $a0, addition
syscall	
addi $v0, $zero, 1
add $a0, $zero, $s3
syscall	

addi $v0, $zero, 4
la $a0, multiplication
syscall	
addi $v0, $zero, 1
add $a0, $zero, $s2
syscall	

addi $v0, $zero, 4
la $a0, subtraction
syscall	
addi $v0, $zero, 1
add $a0, $zero, $s4
syscall	

addi $v0, $zero, 4
la $a0, division
syscall	
addi $v0, $zero, 1
add $a0, $zero, $s1
syscall	

