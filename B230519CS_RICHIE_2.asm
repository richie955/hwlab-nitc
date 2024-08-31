#computing factorial.
.text
main:

li $v0 5
syscall
move $t1,$v0 #input

#for i= t1 down to 1
#t1=t1*i;
#this is the logic.

move $t2,$t1 #initialise t2=t1;

loop:

subi $t2,$t2,1  	#t2--;
mul $t1,$t2,$t1		#t1=t2*t1;

sgt $t3,$t2,1 
beq $t3,1,loop

li $v0,1
move $a0,$t1
syscall

li $v0,10
syscall




