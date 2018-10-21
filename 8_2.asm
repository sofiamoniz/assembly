	.data
maius:	.space	20
minus:	.asciiz	"texto-em-minusculas"
	.text
	.globl main
main:
	addi	$t0,$0,0	#i=t0
	la	$t1,minus

while:
	addu	$t2,$t0,$t1	#t2=&minus[i]
	lb	$t3,0($t2)	#t3=minus[i]
	beq	$t3,'\0',end_while
	add	$t3,$t3,'A'
	sub	$t3,$t3,'a'
	la	$t4,maius
	addu	$t5,$t4,$t0
	sb	$t3,0($t5)
	addi	$t0,$t0,1	#i++
	j	while
	
end_while:
	la	$a0,maius
	li	$v0,4
	syscall
	
	li	$v0,10
	syscall
	