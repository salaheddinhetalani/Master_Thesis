
bgeu.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00500093          	li	ra,5
   4:	ffa00113          	li	sp,-6
   8:	00000f93          	li	t6,0
   c:	00000f13          	li	t5,0
  10:	00000e93          	li	t4,0
  14:	00000e13          	li	t3,0
  18:	0020f663          	bleu	sp,ra,24 <TRY1>
  1c:	00f00f93          	li	t6,15
  20:	00117663          	bleu	ra,sp,2c <TRY2>

00000024 <TRY1>:
  24:	00f00f13          	li	t5,15
  28:	00000013          	nop

0000002c <TRY2>:
  2c:	00f00e93          	li	t4,15
  30:	0010f463          	bleu	ra,ra,38 <TRY3>
  34:	00000013          	nop

00000038 <TRY3>:
  38:	00f00e13          	li	t3,15
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop
  4c:	00000013          	nop

00000050 <_end>:
  50:	00100073          	ebreak
