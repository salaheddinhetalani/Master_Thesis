
test_3.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	18000093          	li	ra,384
   4:	02400113          	li	sp,36
   8:	03c00193          	li	gp,60
   c:	0020a023          	sw	sp,0(ra)
  10:	0030a223          	sw	gp,4(ra)
  14:	00010067          	jr	sp
  18:	00018213          	mv	tp,gp
  1c:	00010293          	mv	t0,sp
  20:	00310333          	add	t1,sp,gp
  24:	0040a383          	lw	t2,4(ra)
  28:	00318433          	add	s0,gp,gp
  2c:	00038067          	jr	t2
  30:	003104b3          	add	s1,sp,gp
  34:	00318533          	add	a0,gp,gp
  38:	003385b3          	add	a1,t2,gp
  3c:	00238633          	add	a2,t2,sp
  40:	00c0a423          	sw	a2,8(ra)
  44:	00c606b3          	add	a3,a2,a2
  48:	0080a703          	lw	a4,8(ra)
  4c:	02360063          	beq	a2,gp,6c <HALT>
  50:	00070767          	jalr	a4,a4
  54:	00e78833          	add	a6,a5,a4
  58:	00d708b3          	add	a7,a4,a3
  5c:	00310933          	add	s2,sp,gp
  60:	00d189b3          	add	s3,gp,a3
  64:	0080aa03          	lw	s4,8(ra)
  68:	034a2423          	sw	s4,40(s4)

0000006c <HALT>:
  6c:	00000013          	nop
  70:	00000013          	nop
  74:	00000013          	nop
  78:	00000013          	nop
  7c:	00000013          	nop

00000080 <_end>:
  80:	00100073          	ebreak
