	.data
rsll:	.asciiz "Resultado shift left logical"
rsrl:	.asciiz "\nResultado shift right logical"
rsra:	.asciiz "\nResultado shift right arithmetic"
	.text
	.globl main

main:	addi	$t0,$0,0xF7F7F7F7 #adicionada o nmr a $t0

	sll	$t1,$t0,4
	srl	$t2,$t0,4
	sra	$t3,$t0,4
	
	#print da primeira frase
	la	$a0,rsll
	li	$v0,4
	syscall
	
	#adicionar t1 a a0
	add	$a0,$0,$t1
	li	$v0,34
	syscall
	
	#o mesmo para o restante
	la	$a0, rsrl
	li	$v0,4
	syscall
	
	add	$a0,$0,$t2
	li	$v0,34
	syscall
	
	la	$a0, rsra
	li	$v0,4
	syscall
	
	add	$a0,$0,$t3
	li	$v0,34
	syscall
	
	
	
	


