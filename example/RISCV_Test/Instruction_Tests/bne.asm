
bne.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00500093          	li	ra,5
   4:	ffa00113          	li	sp,-6
   8:	ffa00193          	li	gp,-6
   c:	00000f93          	li	t6,0
  10:	00000f13          	li	t5,0
  14:	00000e93          	li	t4,0
  18:	00209263          	bne	ra,sp,1c <TRY1>

0000001c <TRY1>:
  1c:	00f00f93          	li	t6,15
  20:	00311663          	bne	sp,gp,2c <TRY2>
  24:	00009863          	bnez	ra,34 <TRY3>
  28:	00000013          	nop

0000002c <TRY2>:
  2c:	00f00f13          	li	t5,15
  30:	00000013          	nop

00000034 <TRY3>:
  34:	00f00e93          	li	t4,15
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop

0000004c <_end>:
  4c:	00100073          	ebreak
