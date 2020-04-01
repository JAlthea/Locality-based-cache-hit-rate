	.data
src:	0x10010020
dst:	0x10040000
count:	32

	.text
	.globl main
main:	
	lw $s0, src		# src[], address
	lw $s1, dst		# dst[], address
	lw $s2, count		# var for array_size = 32
	
	li $s3, 0		# i = 0
#-------for-outer-start-------
L1:	li $s4, 0		# j = 0
#-------for-inner-start-------
#-------src[i][j] : address-------
L2:	sll $t0, $s3, 5		# $t0 = i * 32
	addu $t0, $t0, $s4	# $t0 = i * 32 + j
	sll $t0, $t0, 2		# $t0 = [i][j], byte-offset, (i * 32 + j) * 4
	addu $t1, $s0, $t0	# $t1 = src[], base address + $t0
#-------src[i][j] : allocation-------
	sll $t4, $s3, 5		# $t4 = i * 32
	addu $t4, $t4, 20134076 # $t4 = i * 32 + 20134076
	sll $t4, $t4, 4		# $t4 = $t4 * 4
	sw $t4, 0($t1)		# src[i][j] = $t4
#-------dst[i][j] : address-------
	addu $t3, $s1, $t0	# $t3 = dst[], base address + $t0
#-------dst[i][j] : allocation-------
	lw $t2, 0($t1)		# $t2 = src[i][j]
	sll $t2, $t2, 2		# $t2 = $t2 * 2
	sw $t2, 0($t3)		# dst[i][j] = $t2
#------------------------------	
	addiu $s4, $s4, 1	# j++
	bne $s4, $s2, L2	# j < 32, L2
#-------for-inner-end-------
	addiu $s3, $s3, 1	# i++
	bne $s3, $s2, L1	# i < 32, L1
#-------for-outer-end-------
	
	li $v0, 10
	syscall
