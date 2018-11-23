
recursive_sum.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00900093          	li	ra,9
   4:	10000f13          	li	t5,256
   8:	01800fef          	jal	t6,20 <FAB>

0000000c <HALT>:
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop

0000001c <_end>:
  1c:	00100073          	ebreak

00000020 <FAB>:
  20:	000f8193          	mv	gp,t6
  24:	03c00fef          	jal	t6,60 <PUSH>
  28:	00200213          	li	tp,2
  2c:	0240c263          	blt	ra,tp,50 <RET_ONE>
  30:	001001b3          	add	gp,zero,ra
  34:	02c00fef          	jal	t6,60 <PUSH>
  38:	fff08093          	addi	ra,ra,-1
  3c:	fe5fffef          	jal	t6,20 <FAB>
  40:	02c00fef          	jal	t6,6c <POP>
  44:	003e8eb3          	add	t4,t4,gp
  48:	00000193          	li	gp,0
  4c:	00018463          	beqz	gp,54 <RET>

00000050 <RET_ONE>:
  50:	00100e93          	li	t4,1

00000054 <RET>:
  54:	01800fef          	jal	t6,6c <POP>
  58:	00300fb3          	add	t6,zero,gp
  5c:	000f8067          	jr	t6

00000060 <PUSH>:
  60:	004f0f13          	addi	t5,t5,4
  64:	003f2023          	sw	gp,0(t5)
  68:	000f8067          	jr	t6

0000006c <POP>:
  6c:	000f2183          	lw	gp,0(t5)
  70:	ffcf0f13          	addi	t5,t5,-4
  74:	000f8067          	jr	t6
