	.data
src:	0x10010020
dst:	0x10040000
count:	32

	.text
	.globl main
main:	
	lw $s0, src		# src[]�� �ּ�
	lw $s1, dst		# dst[]�� �ּ�
	lw $s2, count		# �迭�� ũ�� 32�� ��Ÿ���� ����
	
	li $s4, 0		# j = 0
#-------for-outer-start-------
L1:	li $s3, 0		# i = 0
#-------for-inner-start-------
#-------src[j][i]�� �ּ�-------
L2:	sll $t0, $s3, 5		# $t0 = j * 32
	addu $t0, $t0, $s4	# $t0 = j * 32 + i
	sll $t0, $t0, 2		# $t0 = [i][j]�� byte-offset, (j * 32 + i) * 4
	addu $t1, $s0, $t0	# $t1 = src[]�� ���̽��ּ� + $t0
#-------src[j][i]�� �Ҵ�-------
	sll $t4, $s4, 5		# $t4 = j * 32
	addu $t4, $t4, 20134076 # $t4 = j * 32 + 20134076
	sll $t4, $t4, 4		# $t4 = $t4 * 4
	sw $t4, 0($t1)		# src[j][i] = $t4
#-------dst[j][i]�� �ּ�-------
	addu $t3, $s1, $t0	# $t3 = dst[]�� ���̽��ּ� + $t0
#-------dst[j][i]�� �Ҵ�-------
	lw $t2, 0($t1)		# $t2 = src[j][i]
	sll $t2, $t2, 2		# $t2 = $t2 * 2
	sw $t2, 0($t3)		# dst[j][i] = $t2
#------------------------------	
	addiu $s3, $s3, 1	# i++
	bne $s3, $s2, L2	# i < 32, L2
#-------for-inner-end-------
	addiu $s4, $s4, 1	# j++
	bne $s4, $s2, L1	# j < 32, L1
#-------for-outer-end-------
	
	li $v0, 10
	syscall