.data
prime: .asciiz "sum of inputs is a prime number.\n"
n_prime: .asciiz "sum of inputs is not a prime number.\n"


.text
main:

li $v0,5
syscall
move $t0,$v0  #input 1st number


li $v0,5
syscall	#input 2nd number
move $t1,$v0

add $t1,$t1,$t0 #take sum
div $t2,$t1,2	#t2 has t1/2

li $t3,2	#t3 has 2 initialsied.

loop:

div $t1,$t3
mfhi $t4	#reminder of t1/t3 in t4 and check if t4 is 0.
beq $t4, 0 ,nprime
add $t3,$t3,1
ble $t3,$t2 loop

#only executes next segment code if loop fully executes and not_prime section doesnt run.

li $v0,4 #for printing string cmd "prime"
la $a0,prime
syscall

li $v0,10
syscall


nprime:	#number is not prime
li $v0,4
la $a0 ,n_prime
syscall

li $v0,10
syscall
