.data

input: .space 100
inputsize: .word 100
msg_enter: .asciiz "enter a string\n"
.text
main:


li $v0,4
la $a0,msg_enter
syscall

li,$v0,8 #entering a string cmd.(required 2 arguments address of string and size of string.)
la $a0,input
lw $a1,inputsize
syscall

li $t0,0

loop:
#You need to compare registers or an immediate value. IN BEQ
#beq input($t0),10,end
#lb $t3,input($t0)
#higefHfs{}[]wdq
#HIGEFhFS{};=WDQ

lb $t3,input($t0) #load each byte in the string to t3 in loop.
beq $t3,10,end	#checking if byte is newline charecter for termination

bgt $t3, 'z' ,increment
#blt $t3, 'A',increment
bge $t3,'A',small

increment:
addi $t0,$t0,1
j loop


small:

ble $t3,'Z',capital
blt $t3,'a',increment
subi $t3,$t3,32
sb $t3,input($t0)
j increment

capital:

addi $t3,$t3,32
sb $t3,input($t0)
j increment


end:

li $v0,4
la $a0,input
syscall

li $v0,10
syscall
