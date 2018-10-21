	.data
lista:	.space	24
str:	.asciiz	 "Insira 6 numeros:"
	.text
	.globl	main
main:
	la	$a0,str
	li	$v0,4
	syscall
	
	addi	$t0,$0,0	#i=t0
	la	$t1,lista
	
for:
	bge	$t0,6,end_for
	
	li	$v0,5
	syscall
	
	move	$t3,$v0
	
	sll	$t2,$t0,2
	addu	$t2,$t2,$t1 #t2=&lista[i]
	sw	$t3,0($t2)
	
	addi	$t0,$t0,1	#i++
	
	j	for
	
end_for:
	li	$v0,10
	syscall