	.data
prompt1:.asciiz"Introduza um numero: "
result: .asciiz "\n o numero em hexa é: "
	.text
	.globl main
main:
	la $a0,prompt1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	move $t0,$v0 #$t0=num
	
	la $a0,result
	li $v0,4
	syscall
	
	addi $t1,$0,0 #$t1=n=0
	addi $t2,$0,8 #$t2=8
	li $t3,0xF0000000 #$t3=0xF0000000
	
for:	bge $t1,$t2,done
	and $t4,$t0,$t3 #no $t4 está o resultado do and
	srl $a0,$t4,28 #(num & 0xF0000000) >> 28)
	li $v0,34
	syscall
	sll $t0,$t0,4 #num=num << 4 
	addi $t1,$t1,1
	j for

done:
	li $v0,10
	syscall
	
	
