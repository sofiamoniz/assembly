	.data
char:	.asciiz "-"
	.text
	.globl main
main:
	li	$t2,0xF000000
	and	$t3,$t2,$t1
	
	srl	$a0,$t3,28
	li	$v0,34
	syscall
	
	la	$a0,char
	li	$v0,4
	syscall
	