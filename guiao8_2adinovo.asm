	.data
lista:	.space	24
prompt:	.asciiz "Insira 6 numeros: "
	.text
	.globl main
	
main:
	addi	$t0,$0,0	#i=t0
	addi	$t1,$0,6	#6=t1
	la	$t2,lista	#lista=t2
	
	la	$a0,prompt
	li	$v0,4
	syscall
	
for:	bge	$t0,$t1,end_for
	
	li	$v0,5
	syscall
	
	move	$t3,$v0 #primeiro numero lido em t3
	
	sll	$t4,$t0,2 #t4 =i*4
	addu	$t4,$t4,$t2 #lista+i
	sw	$t3,0($t4) 
	
	addi	$t0,$t0,1 #i++
	

	j	for
	
	
end_for:
	#para fazer o print posso adicionar o código do exercício anterior

	move 	$a0, $t4
	li 	$v0, 1
	syscall

	li	$v0,10
	syscall	
	
	
	
