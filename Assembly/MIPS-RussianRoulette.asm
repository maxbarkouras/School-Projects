# russian roulette written in MIPS

.data
hello: .asciiz "Hello! Welcome to Russian Roulette!\n\n"
rules: .asciiz "The revolver infront of you has 6 cartridges and a bullet in one.\nWith every shot you take, your odds of survival will go down, but your closeness to winning will go up.\nYou'll also have the option to spin the barrel after every shot, resetting your odds. You win if you're lucky enough to survive 5 shots in a row. Will you survive?\n\n"
begin: .asciiz "So, lets begin! From now on, when you want to fire you will type 0 and when you want to spin you will type 1. Would you like to fire, or spin to start: "
prompt: .asciiz "Are we spinning or firing: "
die: .asciiz "Whoops! Well that was a great try!"
win: .asciiz "Wow, against all odds you won! Congrats!"
survived: .asciiz "Congrats! You did not die, lets continue!\n"
spun: .asciiz "Barrel spun, odds reset!\n"

.text
addi $t3, $zero, 0			#define necessary registers for comparisons
addi $t4, $zero, 1
addi $t5, $zero, 6

addi $v0, $zero, 4
la $a0, hello
syscall				        	#output hello message

addi $v0, $zero, 4
la $a0, rules
syscall				        	#output rules message

addi $v0, $zero, 4
la $a0, begin
syscall			        		#ouput begin message

add $a1, $zero, $t5
addi $v0, $zero, 42
syscall				        	#generate random num 1-6 for placment of round, put it in $t2
addi $t2, $a0, 1

add $a1, $zero, $t5
addi $v0, $zero, 42
syscall					        #generate players odds 1-6, put it in $t6
addi $t6, $a0, 1

loop:
	addi $v0, $zero, 5
	syscall				        #get user input for fire/spin
	beq $v0, $t3, fire		#if user input is fire, jump to fire
	beq $v0, $t4, spin		#if user input is spin, jump to spin

fire:
	beq $t6, $t2, dead		  #if bullet position = current position jump to dead
	subi, $t5, $t5, 1		    #subtract 1 from $t5 to reduce odds
	beq $t5, $t4, victory		#if only one position is left, jump to win
	addi $v0, $zero, 4
	la $a0, survived		
	syscall				          #output survived message
	addi $v0, $zero, 4
	la $a0, prompt
	syscall				          #output spin or fire message
	add $a1, $zero, $t5		
	addi $v0, $zero, 42
	syscall				          #regenerate placement of round in barell, at 1/6th lower odds
	addi $t2, $a0, 1

	add $a1, $zero, $t5		
	addi $v0, $zero, 42
	syscall				          #regenerate players position, at 1/6th lower odds
	addi $t6, $a0, 1
	j loop				          #jump to fire/spin loop

spin:
	addi $t5, $zero, 6 
	addi $a1, $zero, 6
	addi $v0, $zero, 42
	syscall			          	#regenerate placement of round in barell, at new odds
	addi $t6, $a0, 1
	addi $a1, $zero, 6
	addi $v0, $zero, 42
	syscall			          	#regenerate players position, at new odds
	addi $t2, $a0, 1
	addi $v0, $zero, 4
	la $a0, spun
	syscall				          #output barrel spun message
	addi $v0, $zero, 4
	la $a0, prompt
	syscall			          	#output spin or fire message
	j loop				          #jump to fire/spin loop

dead:
	addi $v0, $zero, 4		
	la $a0, die
	syscall				          #output die message
	addi $v0, $zero, 10
	syscall				          #exit program
	
victory:
	addi $v0, $zero, 4
	la $a0, win			        #output win message
	syscall
	addi $v0, $zero, 10		  #exit process
