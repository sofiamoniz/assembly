	.data
prompt1:.asciiz	"Introduza um numero: "
result:	.asciiz	"\n O número em hexadecimal e’: "
	.text
	.globl main
main:
	addi	$t0,$0,0	#t0=n
	addi	$t1,$0,0	#t1=num

	la	$a0,prompt1
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall
	
	move	$t2,$v0	#t2=num
	
	la	$a0,result
	li	$v0,4
	syscall
	
for:
	bge	$t0,8,end_for
	andi	$t3,$t2,0xF0000000
	sll	$t4,$t3,28
	sll	$t2,$t2,4
	
end_for:
	move	$a0,$t2
	
	li	$v0,35
	syscall
	
	
	