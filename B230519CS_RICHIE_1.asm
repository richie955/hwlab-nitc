#for odd-even checking, returning 0 if input is odd.
#divide it by 2 and chack reminder is 1 or 0, if 0 even, else odd.
.text
main:

li $v0 ,5
syscall
move $t1,$v0	#for taking input, load v0 with 5 is command for scanf ->in c.

li $t2 ,2 	#load 2 into t2
div $t1,$t2	#div and store reminder to hi
mfhi $t3	#movefrom hi to t3 reg.

beq $t3,$zero,even
li $t4,0  #odd case(return 0)
j end

even:
li $t4,1	#even case(return 1)

end:
li $v0,1
move $a0,$t4	# for print: when syscall is called, because v0 has 1 in it, it checks value of a0 to be printed.
syscall 

li $v0,10	#exit code
syscall


