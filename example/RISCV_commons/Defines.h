#ifndef PROJECT_DEFINES_H
#define PROJECT_DEFINES_H

#define MEM_START_ADDR 0x0
#define MEM_DEPTH MEM_START_ADDR + 0x10000

#define OPCODE_R    0x33 //0110011
#define OPCODE_I_I  0x13 //0010011
#define OPCODE_I_L  0x03 //0000011
#define OPCODE_I_J  0x67 //1100111
#define OPCODE_S    0x23 //0100011
#define OPCODE_B    0x63 //1100011
#define OPCODE_U1   0x37 //0110111
#define OPCODE_U2   0x17 //0010111
#define OPCODE_J    0x6F //1101111

#define OPCODE_FIELD(x) ((x) & 0x7F)
#define FUNCT3_FIELD(x) (((x) >> 12) & 0x07)
#define FUNCT7_FIELD(x) (((x) >> 25) & 0x7F)
#define RS1_FIELD(x)    (((x) >> 15) & 0x1F)
#define RS2_FIELD(x)    (((x) >> 20) & 0x1F)
#define RD_FIELD(x)     (((x) >>  7) & 0x1F)
#define SIGN_FIELD(x)   (((x) >> 31) & 0x01)

#define POS_IMM_I_FIELD(x)  ((x) >> 20)
#define POS_IMM_S_FIELD(x)  ((((x) >> 20) & 0xFE0) | (((x) >> 7) & 0x1F))
#define POS_IMM_B_FIELD(x)  ((((x) << 4) & 0x800) | (((x) >> 20) & 0x7E0) | (((x) >> 7) & 0x1E))
#define POS_IMM_J_FIELD(x)  (((x) & 0xFF000) | (((x) >> 9) & 0x800) | (((x) >> 20) & 0x7FE))
#define NEG_IMM_I_FIELD(x)  (static_cast<unsigned int>(0xFFFFF000) | POS_IMM_I_FIELD(x))
#define NEG_IMM_S_FIELD(x)  (static_cast<unsigned int>(0xFFFFF000) | POS_IMM_S_FIELD(x))
#define NEG_IMM_B_FIELD(x)  (static_cast<unsigned int>(0xFFFFF000) | POS_IMM_B_FIELD(x))
#define NEG_IMM_J_FIELD(x)  (static_cast<unsigned int>(0xFFF00000) | POS_IMM_J_FIELD(x))
#define IMM_U_FIELD(x)      ((x) & static_cast<unsigned int>(0xFFFFF000))


enum class InstrType {
    INSTR_UNKNOWN,
    INSTR_ADD, INSTR_SUB, INSTR_SLL, INSTR_SLT, INSTR_SLTU, INSTR_XOR, INSTR_SRL, INSTR_SRA, INSTR_OR, INSTR_AND,   // R format
    INSTR_ADDI, INSTR_SLLI, INSTR_SLTI, INSTR_SLTUI, INSTR_XORI, INSTR_SRLI, INSTR_SRAI, INSTR_ORI, INSTR_ANDI,     // I format (I_I)
    INSTR_LB, INSTR_LH, INSTR_LW, INSTR_LBU, INSTR_LHU,                                                             // I format (I_L)
    INSTR_JALR,                                                                                                     // I format (I_J)
    INSTR_SB, INSTR_SH, INSTR_SW,                                                                                   // S format
    INSTR_BEQ, INSTR_BNE, INSTR_BLT, INSTR_BGE, INSTR_BLTU, INSTR_BGEU,                                             // B format
    INSTR_LUI, INSTR_AUIPC,                                                                                         // U format
    INSTR_JAL                                                                                                       // J format
};


// NOT USED IN PIPELINE OR ISA ANYMORE
#define RD_MSB  11
#define RD_LSB  7
#define RS1_MSB 19
#define RS1_LSB 15
#define RS2_MSB 24
#define RS2_LSB 20

#define Fill(amt) ((1 << amt) - 1)
#define Cat(a, sz1, b, sz2) (((Fill(sz1) << sz2) & (a << sz2)) | (Fill(sz2) & b))
#define Sub(a, i1, i2) ((a >> i2) & Fill(i1 - i2 + 1))

#define Set(a,i) (a ^ ((-1 ^ a) & (1UL << i)) )
#define Clr(a,i) (a ^ ((-0 ^ a) & (1UL << i)) )


enum class InstrTypeOld {
    Unknown,  addI,  andI,  orI,
    xorI, sltI, sltIu, sllI, srlI, sraI, add, sub, sll_Instr, slt, sltu, Xor_Instr,
    srl_Instr, sra_Instr, Or_Instr, And_Instr, beq, bne,
    blt, bge, bltu, bgeu, lb, lh, lw, lbu, lhu, lui, auipc, jal, jalr, sb, sh, sw};


#endif // PROJECT_DEFINES_H