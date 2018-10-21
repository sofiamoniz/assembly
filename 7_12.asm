	.data
prompt1:.asciiz	"Introduza um numero\n"
char:	.asciiz	"-"

	.text
	.globl main
main:
	la	$a0,prompt1
	li	$v0,4
	syscall
	
	addi	$t1,$0,0	#i=t1
	
	li	$v0,5
	syscall
	
	move	$t0,$v0	#t0=a

for:	
	bge	$t1,$t0,end_for
	
	la	$a0,char
	li	$v0,4
	syscall
	
	addi	$t1,$t1,1	#i++
	j	for
end_for:	
	li	$v0,10
	syscall