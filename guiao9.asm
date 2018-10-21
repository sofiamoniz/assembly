	.data
frase1:	.space	20
frase2:	.space	20
frase3:	.space	40
string1:.asciiz	"\nInsira a frase1: "
string2:.asciiz "\nInsira a frase2: "
result1:.asciiz	"\n O numero de caracteres da frase1 é: "
result2:.asciiz	"\nA frase concatenada é: "
	.text
	.globl main
main:	
	la	$a0,string1
	li	$v0,4
	syscall
	
	la	$a0,frase1
	li	$a1,20
	li	$v0,8
	syscall
	
	la	$a0,string2
	li	$v0,4
	syscall
	
	la	$a0,frase2
	la	$a1,20
	li	$v0,8
	syscall
	
	la	$a0,result1
	li	$v0,4
	syscall
	
	la	$a0,frase1
	jal	strlen #n=v0
	
	move	$a0,$v0
	
	li	$v0,1
	syscall
	
	la	$a0,frase2
	li	$v0,4
	syscall
	
	la	$a0,frase3
	la	$a1,frase1
	
	jal	strcopy
	
	la	$a1,frase2
	
	jal	strcat #frase 3 em v0
	
	move	$a0,$v0
	
	li	$v0,4
	syscall
	
	li	$v0,10
	syscall
	
	
	
	#main por acabar
	
strlen:
	addi	$t0,$0,0	#t0=i=0
	addi	$v0,$0,0	#v0=n está em v0 para depois ser retornado

	while_strlen:
			addu	$t1,$t0,$a0 #t1=&str[i]
			lb	$t2,0($t1) #t2=str[i]
			addi	$t0,$t0,1 #i++
			beq	$t2,'\0',end_whilestrlen
			addi	$v0,$v0,1
			j	while_strlen
	end_whilestrlen:
			jr	$ra


strcopy:
	#dst em a0 src em a1
	addi	$t0,$0,0	#t0=i=0
	
	while_strcopy:	addu	$t1,$t0,$a1	#t1=&src[i]
			lb	$t2,0($t1)	#t2=src[i]
			beq	$t2,'\0',end_whilestrcopy
			
			addu	$t3,$a0,$t0	#t3=&dst[i]
			sb	$t2,0($t3)	#dst[i]=src[i]
			
			addi	$t0,$t0,1	#i++
			j	while_strcopy
			
	end_whilestrcopy:
			addu	$t3, $a0, $t0
			li	$t8,'\0'
			sb	$t8,0($t3)
			
			move	$v0,$a0
			
			jr	$ra
			
strcat:
	#dst em a0 src em a1
	
	subu	$sp,$sp,8
	sw	$ra,0($sp)
	sw	$s0,4($sp)
	
	#aux=dst , logo vamos guardar dst num registo que fique salvaguardado
	move	$s0,$a0
	
	while_strcat:	lb	$t0, 0($a0)	#t0 é dst atual
			beq	$t0,'\0',end_whilestrcat
			addi	$a0,$a0,1	#s0++
			j	while_strcat
	end_whilestrcat:
			jal	strcopy
			
			move	$v0,$s0
			
			#fechar espaço
			
			
			lw	$ra,0($sp)
			lw	$s0,4($sp)
			addu	$sp,$sp,8
						
			jr	$ra
	
	