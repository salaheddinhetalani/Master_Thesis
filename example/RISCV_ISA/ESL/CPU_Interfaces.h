#ifndef PROJECT_CPU_INTERFACES_H
#define PROJECT_CPU_INTERFACES_H


enum EncType {
    ENC_R, ENC_I_I, ENC_I_L, ENC_I_J, ENC_S, ENC_B, ENC_U, ENC_J, ENC_ERR
};

enum ALUfuncType {
    ALU_X, ALU_ADD, ALU_SUB, ALU_SLL, ALU_SRL, ALU_SRA, ALU_AND, ALU_OR, ALU_XOR, ALU_SLT, ALU_SLTU, ALU_COPY1
};


struct RegfileWriteType {
    unsigned int dst;
    unsigned int dstData;
};

struct RegfileType {
    unsigned int reg_01;
    unsigned int reg_02;
    unsigned int reg_03;
    unsigned int reg_04;
    unsigned int reg_05;
    unsigned int reg_06;
    unsigned int reg_07;
    unsigned int reg_08;
    unsigned int reg_09;
    unsigned int reg_10;
    unsigned int reg_11;
    unsigned int reg_12;
    unsigned int reg_13;
    unsigned int reg_14;
    unsigned int reg_15;
    unsigned int reg_16;
    unsigned int reg_17;
    unsigned int reg_18;
    unsigned int reg_19;
    unsigned int reg_20;
    unsigned int reg_21;
    unsigned int reg_22;
    unsigned int reg_23;
    unsigned int reg_24;
    unsigned int reg_25;
    unsigned int reg_26;
    unsigned int reg_27;
    unsigned int reg_28;
    unsigned int reg_29;
    unsigned int reg_30;
    unsigned int reg_31;
};

#endif // PROJECT_CPU_INTERFACES_H