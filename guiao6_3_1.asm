	.data
inicial:.asciiz	"Introduza dois números: "
num1:	.asciiz "Primeiro:"
num2:	.asciiz "Segundo:"
soma:	.asciiz	"A soma dos numeros e: "
	.text
	.globl main
main:
	la	$a0,inicial
	li	$v0,4
	syscall
	
	la	$a0,num1
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall
	move $t0,$v0
	
	la	$a0,num2
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall
	move $t1,$v0
	
	add $a0,$t0,$t1
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	