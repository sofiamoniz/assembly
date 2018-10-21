	.data
str:	.space	40
prompt1:.asciiz	"Insira uma string: "
result:	.asciiz	"O comprimento da string é: "
	.text
	.globl main
main:
	la	$a0,str

	la	$a0,prompt1
	li	$v0,4
	syscall
	
	la	$a0,str
	li	$a1,40
	li	$v0,8
	syscall
	
	jal	strlen
	
	move	$t4,$v0	#t0=n
	
	la	$a0,result
	li	$v0,4
	syscall
	
	move	$a0,$t4
	
	li	$v0,1
	syscall
	
	li	$v0,10
	syscall
	
strlen:
	addi	$t0,$0,0	#i=t0
	addi	$v0,$0,0	#n=v0
	
	while:
		addu	$t1,$a0,$t0
		lb	$t2,0($t1) #t2=str[i]
		
		
		beq	$t2,'\0',end_while
		addi	$t0,$t0,1 #i++
		addi	$v0,$v0,1
		
		j	while
	end_while:
		jr	$ra	
