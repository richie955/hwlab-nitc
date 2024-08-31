.data
msg: .asciiz "enter a string\n"
palindrome_msg: .asciiz "its a palindrome\n"
not_palindrome_msg: .asciiz "its not a palindrome\n"
input: .space 100
input_size: .word 100

.text
main:

li $v0,4
la $a0,msg
syscall

li $v0,8
la $a0,input
lw $a1,input_size
syscall


move $t0,$zero

loop:
lb $t1 input($t0)
beq $t1,10,len_calculated
addi $t0,$t0,1
j loop


len_calculated:
subi $s1,$t0,1 #index of last charecter.
move $s0,$zero



palindrome:
bgt $s0,$s1,p
lb $t2,input($s0)
lb $t3,input($s1)
bne $t2,$t3,not_p

addi $s0,$s0,1
subi $s1,$s1,1
j palindrome

p:
li $v0,4
la $a0,palindrome_msg
syscall

li $v0,10
syscall

not_p:
li $v0,4
la $a0,not_palindrome_msg
syscall

li $v0,10
syscall



