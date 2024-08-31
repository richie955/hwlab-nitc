.data
msg: .asciiz "enter a string\n"
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

li $t0,0 #index
li $t1,0 #result

convert:
lb $t2,input($t0)
beq $t2,10,exit
sll $t1,$t1,1
subi $t2 $t2 48
add $t1 $t1 $t2
addi $t0,$t0,1
j convert


exit:
li $v0,1
move $a0,$t1
syscall 



