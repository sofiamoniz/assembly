	.data
prompt1:.asciiz	"Introduza um numero\n"
result:	.asciiz	"O fatorial do número inserido é: "
	.text
	.globl	main
main:
	la	$a0,prompt1
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall
	
	move	$t0,$v0	#t0=n i=n
	
	addi	$t1,$0,1	#f=1=t1
	
for:
	ble	$t0,$0,end_for
	mult	$t1,$t0	
	mflo	$t1
	sub	$t0,$t0,1 #i--

	j	for

end_for:
	la	$a0,result
	li	$v0,4
	syscall
	
	move	$a0,$t1
	
	li	$v0,1
	syscall
	
	li	$v0,10
	syscall
	
	
	
