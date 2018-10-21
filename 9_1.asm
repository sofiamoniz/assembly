	.data
prompt1:.asciiz	"Introduza um numero\n"
result:	.asciiz	"O fatorial do número inserido é: "
	.text
	.globl main
main:
	la	$a0,prompt1
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall
	
	move	$a0,$v0 #a0=num
	
	jal	fatorial
	
	move	$t0,$v0 #t0=fatorial(n)
	
	la	$a0,result
	li	$v0,4
	syscall
	
	move	$a0,$t0
	
	li	$v0,1
	syscall
	
	li	$v0,10
	syscall
	
	
fatorial:
	addi	$v0,$0,1	#res=1=v0 (para que depois possa ser retornado)
	move	$t1,$a0
	
	for:
		ble	$t1,0,end_for
		mul	$v0,$v0,$t1
		subi	$t1,$t1,1
		j	for
	end_for:
		jr	$ra
	
