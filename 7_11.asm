	.data
prompt1:.asciiz "Introduza um numero\n"
strpar:	.asciiz "O numero é par\n"
strimp:	.asciiz "O numero é impar\n"
	.text
	.globl main
main:
	la	$a0,prompt1
	li	$v0,4
	syscall
	
	li	$v0,5
	syscall
	
	move $t0,$v0	#t0=a
	
	and	$t1,$t0,1
	
if:	bne	$t1,0,else
	la	$a0,strpar
	li	$v0,4
	syscall
	j	end
	
else:
	la	$a0,strimp
	li	$v0,4
	syscall
	
	j	end

end:
	li	$v0,10
	syscall