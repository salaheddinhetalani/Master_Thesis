
blt.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00500093          	li	ra,5
   4:	ffa00113          	li	sp,-6
   8:	00000f93          	li	t6,0
   c:	00000f13          	li	t5,0
  10:	00000e93          	li	t4,0
  14:	0020c463          	blt	ra,sp,1c <TRY1>
  18:	00114663          	blt	sp,ra,24 <TRY2>

0000001c <TRY1>:
  1c:	00f00f93          	li	t6,15
  20:	00000013          	nop

00000024 <TRY2>:
  24:	00f00f13          	li	t5,15
  28:	0010ce63          	blt	ra,ra,44 <TRY3>
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop

00000040 <_end>:
  40:	00100073          	ebreak

00000044 <TRY3>:
  44:	00f00e93          	li	t4,15
  48:	00000013          	nop
