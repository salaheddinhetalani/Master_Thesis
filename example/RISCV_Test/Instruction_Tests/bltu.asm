
bltu.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00500093          	li	ra,5
   4:	ffa00113          	li	sp,-6
   8:	00000f93          	li	t6,0
   c:	00000f13          	li	t5,0
  10:	00000e93          	li	t4,0
  14:	00000e13          	li	t3,0
  18:	00116463          	bltu	sp,ra,20 <TRY1>
  1c:	0020e663          	bltu	ra,sp,28 <TRY2>

00000020 <TRY1>:
  20:	00f00f93          	li	t6,15
  24:	00000013          	nop

00000028 <TRY2>:
  28:	00f00f13          	li	t5,15
  2c:	0210e063          	bltu	ra,ra,4c <TRY3>
  30:	00f00e93          	li	t4,15
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop

00000048 <_end>:
  48:	00100073          	ebreak

0000004c <TRY3>:
  4c:	00f00e13          	li	t3,15
  50:	00000013          	nop
