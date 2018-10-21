	.data
lista:	.space	24
houvetroca:.word 0
print:	.asciiz "Conteúdo do array"
	.text
	.globl main
main:
	#houvetroca=1=true
	lw	$a1,houvetroca	#houvetroca=a1=0=false
	addi	$t1,$0,0	#aux=t1
	addi	$t2,$0,0	#i=t2
	addi	$t3,$0,5	#t3=size-1
	la	$t4,lista	#t4=lista
do:
	
	
	bge	$t2,$t3,end_do
	sll	$t5,$t2,2 #t5=i*4
	addu	$t5,$t5,$t4 #lista[i]
	
	addi	$t6,$t2,1	#t6=i+1	

	sll	$t7,$t6,2	#t7=(i+1)*4
	addu	$t7,$t7,$t4	#lista[i+1]
	
	ble	$t5,$t7,end
	
	#aux = lista[i];  aux está em t1 e lista[i] está em $t5
	
	la	$s0,$t1
	la	$s1,$t5
	lw	$s2,0($s0)
	sw	$s2,0($s1)
	
	#lista[i] = lista[i+1]; lista[i] em $t5 e lista[i+1] em $t7
	la	$s3,$t5
	la	$s4,$t7
	lw	$s5,0($s3)
	sw	$s5,0($s4)
	
	#lista[i+1] = aux; lista[i+1] está em t7 e aux em $s0
	la	$s7,$t7
	lw	
	
	
	
	#houveTroca = TRUE;
	la	$a1,houvetroca
	li	$a1,1
	sw	$a2,0($a1) #houvetroca=1
	lw	$a2,houvetroca #obter valor do houvetroca que neste momento é true

while:
	bne	$t0,0,end
	j	do
		
end:
	li	$v0,10
	syscall	