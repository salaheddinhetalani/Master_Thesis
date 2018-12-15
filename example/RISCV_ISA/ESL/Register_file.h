#ifndef PROJECT_REGISTER_FILE_H
#define PROJECT_REGISTER_FILE_H

#include <iomanip>
#include "systemc.h"
#include "Interfaces.h"
#include "CPU_Interfaces.h"


class Register_file : public sc_module {
public:

    //Constructor
    SC_HAS_PROCESS(Register_file);

    Register_file(sc_module_name name) :
            toRegfilePort("regfileInPort"),
            fromRegfilePort("regfileOutPort"),
            reg_01(0),
            reg_02(0),
            reg_03(0),
            reg_04(0),
            reg_05(0),
            reg_06(0),
            reg_07(0),
            reg_08(0),
            reg_09(0),
            reg_10(0),
            reg_11(0),
            reg_12(0),
            reg_13(0),
            reg_14(0),
            reg_15(0),
            reg_16(0),
            reg_17(0),
            reg_18(0),
            reg_19(0),
            reg_20(0),
            reg_21(0),
            reg_22(0),
            reg_23(0),
            reg_24(0),
            reg_25(0),
            reg_26(0),
            reg_27(0),
            reg_28(0),
            reg_29(0),
            reg_30(0),
            reg_31(0),
            rec(false)
    {
        SC_THREAD(run);
    }

    slave_in<RegfileWriteType> toRegfilePort;
    slave_out<RegfileType> fromRegfilePort;

    RegfileWriteType regfileWrite;
    RegfileType regfile; // RegisterFile

    // register file data
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

    bool rec;

    void run(); // thread

    void log(); // log reg file
};


void Register_file::run() {

    while (true) {

        // return current data
        regfile.reg_01 = reg_01;
        regfile.reg_02 = reg_02;
        regfile.reg_03 = reg_03;
        regfile.reg_04 = reg_04;
        regfile.reg_05 = reg_05;
        regfile.reg_06 = reg_06;
        regfile.reg_07 = reg_07;
        regfile.reg_08 = reg_08;
        regfile.reg_09 = reg_09;
        regfile.reg_10 = reg_10;
        regfile.reg_11 = reg_11;
        regfile.reg_12 = reg_12;
        regfile.reg_13 = reg_13;
        regfile.reg_14 = reg_14;
        regfile.reg_15 = reg_15;
        regfile.reg_16 = reg_16;
        regfile.reg_17 = reg_17;
        regfile.reg_18 = reg_18;
        regfile.reg_19 = reg_19;
        regfile.reg_20 = reg_20;
        regfile.reg_21 = reg_21;
        regfile.reg_22 = reg_22;
        regfile.reg_23 = reg_23;
        regfile.reg_24 = reg_24;
        regfile.reg_25 = reg_25;
        regfile.reg_26 = reg_26;
        regfile.reg_27 = reg_27;
        regfile.reg_28 = reg_28;
        regfile.reg_29 = reg_29;
        regfile.reg_30 = reg_30;
        regfile.reg_31 = reg_31;

        fromRegfilePort->nb_write(regfile);

        rec = toRegfilePort->nb_read(regfileWrite);

        if (rec) {

            if (regfileWrite.dst != 0) {

                // write to regfile
                if (regfileWrite.dst == 1) {
                    reg_01 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 2) {
                    reg_02 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 3) {
                    reg_03 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 4) {
                    reg_04 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 5) {
                    reg_05 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 6) {
                    reg_06 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 7) {
                    reg_07 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 8) {
                    reg_08 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 9) {
                    reg_09 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 10) {
                    reg_10 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 11) {
                    reg_11 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 12) {
                    reg_12 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 13) {
                    reg_13 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 14) {
                    reg_14 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 15) {
                    reg_15 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 16) {
                    reg_16 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 17) {
                    reg_17 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 18) {
                    reg_18 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 19) {
                    reg_19 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 20) {
                    reg_20 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 21) {
                    reg_21 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 22) {
                    reg_22 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 23) {
                    reg_23 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 24) {
                    reg_24 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 25) {
                    reg_25 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 26) {
                    reg_26 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 27) {
                    reg_27 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 28) {
                    reg_28 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 29) {
                    reg_29 = regfileWrite.dstData;
                } else if (regfileWrite.dst == 30) {
                    reg_30 = regfileWrite.dstData;
                } else {
                    reg_31 = regfileWrite.dstData;
                }

#ifdef LOGTOFILE
                cout << "S5: @RF: Writing to register x" << dec << regfileWrite.dst << " = 0x" << hex
                 << regfileWrite.dstData << " = " << dec << regfileWrite.dstData << "(dec)" << endl;
                log();  // print regfile
#endif
            }
        }
    }
}


void Register_file::log() {

    stringstream s;

    cout << string(143, '-') << endl;

    cout << "Register File Content (Hex):" << endl;

    cout << string(143, '-') << endl;

    for (int i = 0; i < 32; i++) {
        switch (i) {
            case 0:
                s << dec << "RF[00] 0x0";
                break;
            case 1:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_01;
                break;
            case 2:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_02;
                break;
            case 3:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_03;
                break;
            case 4:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_04;
                break;
            case 5:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_05;
                break;
            case 6:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_06;
                break;
            case 7:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_07 << endl;
                break;
            case 8:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_08;
                break;
            case 9:
                s << dec << "RF[0" << i << "] 0x" << hex << reg_09;
                break;
            case 10:
                s << dec << "RF[" << i << "] 0x" << hex << reg_10;
                break;
            case 11:
                s << dec << "RF[" << i << "] 0x" << hex << reg_11;
                break;
            case 12:
                s << dec << "RF[" << i << "] 0x" << hex << reg_12;
                break;
            case 13:
                s << dec << "RF[" << i << "] 0x" << hex << reg_13;
                break;
            case 14:
                s << dec << "RF[" << i << "] 0x" << hex << reg_14;
                break;
            case 15:
                s << dec << "RF[" << i << "] 0x" << hex << reg_15 << endl;
                break;
            case 16:
                s << dec << "RF[" << i << "] 0x" << hex << reg_16;
                break;
            case 17:
                s << dec << "RF[" << i << "] 0x" << hex << reg_17;
                break;
            case 18:
                s << dec << "RF[" << i << "] 0x" << hex << reg_18;
                break;
            case 19:
                s << dec << "RF[" << i << "] 0x" << hex << reg_19;
                break;
            case 20:
                s << dec << "RF[" << i << "] 0x" << hex << reg_20;
                break;
            case 21:
                s << dec << "RF[" << i << "] 0x" << hex << reg_21;
                break;
            case 22:
                s << dec << "RF[" << i << "] 0x" << hex << reg_22;
                break;
            case 23:
                s << dec << "RF[" << i << "] 0x" << hex << reg_23 << endl;
                break;
            case 24:
                s << dec << "RF[" << i << "] 0x" << hex << reg_24;
                break;
            case 25:
                s << dec << "RF[" << i << "] 0x" << hex << reg_25;
                break;
            case 26:
                s << dec << "RF[" << i << "] 0x" << hex << reg_26;
                break;
            case 27:
                s << dec << "RF[" << i << "] 0x" << hex << reg_27;
                break;
            case 28:
                s << dec << "RF[" << i << "] 0x" << hex << reg_28;
                break;
            case 29:
                s << dec << "RF[" << i << "] 0x" << hex << reg_29;
                break;
            case 30:
                s << dec << "RF[" << i << "] 0x" << hex << reg_30;
                break;
            case 31:
                s << dec << "RF[" << i << "] 0x" << hex << reg_31 << endl;
                break;
            default:
                s << "Error!";
        }

        if (i == 7 || i == 15 || i == 23 || i == 31) {
            cout << left  << s.str();
        } else {
            cout << left << setw(18) << s.str();
        }

        s.str("");
    }

    cout << string(143, '-') << endl;

    cout << "Register File Content (Dec):" << endl;

    cout << string(143, '-') << endl;

    for (int i = 0; i < 32; i++) {
        switch (i) {
            case 0:
                s << dec << "RF[00]   0";
                break;
            case 1:
                s << dec << "RF[0" << i << "]   " << reg_01;
                break;
            case 2:
                s << dec << "RF[0" << i << "]   " << reg_02;
                break;
            case 3:
                s << dec << "RF[0" << i << "]   " << reg_03;
                break;
            case 4:
                s << dec << "RF[0" << i << "]   " << reg_04;
                break;
            case 5:
                s << dec << "RF[0" << i << "]   " << reg_05;
                break;
            case 6:
                s << dec << "RF[0" << i << "]   " << reg_06;
                break;
            case 7:
                s << dec << "RF[0" << i << "]   " << reg_07 << endl;
                break;
            case 8:
                s << dec << "RF[0" << i << "]   " << reg_08;
                break;
            case 9:
                s << dec << "RF[0" << i << "]   " << reg_09;
                break;
            case 10:
                s << dec << "RF[" << i << "]   " << reg_10;
                break;
            case 11:
                s << dec << "RF[" << i << "]   " << reg_11;
                break;
            case 12:
                s << dec << "RF[" << i << "]   " << reg_12;
                break;
            case 13:
                s << dec << "RF[" << i << "]   " << reg_13;
                break;
            case 14:
                s << dec << "RF[" << i << "]   " << reg_14;
                break;
            case 15:
                s << dec << "RF[" << i << "]   " << reg_15 << endl;
                break;
            case 16:
                s << dec << "RF[" << i << "]   " << reg_16;
                break;
            case 17:
                s << dec << "RF[" << i << "]   " << reg_17;
                break;
            case 18:
                s << dec << "RF[" << i << "]   " << reg_18;
                break;
            case 19:
                s << dec << "RF[" << i << "]   " << reg_19;
                break;
            case 20:
                s << dec << "RF[" << i << "]   " << reg_20;
                break;
            case 21:
                s << dec << "RF[" << i << "]   " << reg_21;
                break;
            case 22:
                s << dec << "RF[" << i << "]   " << reg_22;
                break;
            case 23:
                s << dec << "RF[" << i << "]   " << reg_23 << endl;
                break;
            case 24:
                s << dec << "RF[" << i << "]   " << reg_24;
                break;
            case 25:
                s << dec << "RF[" << i << "]   " << reg_25;
                break;
            case 26:
                s << dec << "RF[" << i << "]   " << reg_26;
                break;
            case 27:
                s << dec << "RF[" << i << "]   " << reg_27;
                break;
            case 28:
                s << dec << "RF[" << i << "]   " << reg_28;
                break;
            case 29:
                s << dec << "RF[" << i << "]   " << reg_29;
                break;
            case 30:
                s << dec << "RF[" << i << "]   " << reg_30;
                break;
            case 31:
                s << dec << "RF[" << i << "]   " << reg_31 << endl;
                break;
            default:
                s << "Error!";
        }

        if (i == 7 || i == 15 || i == 23 || i == 31) {
            cout << left  << s.str();
        } else {
            cout << left << setw(18) << s.str();
        }

        s.str("");
    }

    cout << string(143, '-') << endl;
}


#endif  // PROJECT_REGISTER_FILE_H