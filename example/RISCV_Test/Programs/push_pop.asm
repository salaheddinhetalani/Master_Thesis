
push_pop.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	54100193          	li	gp,1345
   4:	04000f13          	li	t5,64
   8:	01c00fef          	jal	t6,24 <PUSH>
   c:	02400fef          	jal	t6,30 <POP>

00000010 <HALT>:
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00000013          	nop

00000020 <_end>:
  20:	00100073          	ebreak

00000024 <PUSH>:
  24:	004f0f13          	addi	t5,t5,4
  28:	003f2023          	sw	gp,0(t5)
  2c:	000f8067          	jr	t6

00000030 <POP>:
  30:	000f2203          	lw	tp,0(t5)
  34:	ffcf0f13          	addi	t5,t5,-4
  38:	000f8067          	jr	t6
