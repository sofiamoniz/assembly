	.data
prompt1:.asciiz	 "Introduza uma string\n"
result:	.asciiz	 "O número de carateres numéricos: "
str:	.space	40
	.text
	.globl main
main:
	addi	$t0,$0,0	#$t0=i
	addi	$t1,$0,0	#t1=n
	
	
	la	$a0,prompt1
	li	$v0,4
	syscall
	
	la	$a0,str
	li	$a1,40
	li	$v0,8
	syscall
	
	la	$t2,str
	
for:
	addu	$t3,$t2,$t0	#t3=$str[i]
	lb	$t4,0($t3)	#t4=str[i]
	beq	$t4,'\0',endfor
	
	if:	
		blt	$t4,'0',endif
		bgt	$t4,'9',endif
		addi	$t1,$t1,1 #n++
		
endif:
	addi	$t0,$t0,1 #i++
	j	for
endfor:
	la	$a0,result
	li	$v0,4
	syscall
	
	move	$a0,$t1
	
	li	$v0,1
	syscall
	