	.data
#texto todo em cima
str1:	.asciiz "Introduza dois números"
str2:	.asciiz "A soma dos nms é: "

	.text
	.globl main

main:	li $v0, 4
	la $a0 , str1
	syscall #printstr(str1) #syscall faz instruçoes de entrada e saida
	
	li $v0,5
	syscall #read_int()
	move $t0, $v0 #$t0=read_int() passar o nmr lido para um outro registo pois $v0 está a ser usado
	
	li $v0,5
	syscall #read_int()
	move $t1, $v0 #temos que mover para o registo t1 pois o v0 já foi usado para 5
	
	li $v0,4
	la $a0, str2
	syscall
	
	add $a0,$t0,$t1
	li $v0,1
	syscall