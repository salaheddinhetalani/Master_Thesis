//
// Created by paulius on 06.14.18.
//

#ifndef PROJECT_CORE_H
#define PROJECT_CORE_H


#include "systemc.h"
#include "Interfaces.h"
#include "CPU_Interfaces.h"
#include "ISA.h"
#include "Register_file.h"

class Core : public sc_module {
public:
    // Constructor
    SC_HAS_PROCESS(Core);

    // Ports (Memory Interface)
    blocking_out<COtoME_IF> COtoME_port;
    blocking_in<MEtoCO_IF> MEtoCO_port;

    // Components
    Isa ISA;
    Register_file RF;

    MasterSlave<RegfileWriteType> toRegfileChannel;
    MasterSlave<RegfileType> fromRegfileChannel;

    Core(sc_module_name name) :
            ISA("ISA"),
            RF("RF"),
            toRegfileChannel("toRegfileChannel"),
            fromRegfileChannel("fromRegfileChannel"),
            COtoME_port("coreOutPort"),
            MEtoCO_port("coreInPort")
    {

        // Module port binding:
        ISA.fromRegfilePort(fromRegfileChannel);
        RF.fromRegfilePort(fromRegfileChannel);
        ISA.toRegfilePort(toRegfileChannel);
        RF.toRegfilePort(toRegfileChannel);

        // Memory interface forwarded to outside
        ISA.toMemoryPort(COtoME_port);
        ISA.fromMemoryPort(MEtoCO_port);
    }
};

#endif //PROJECT_CORE_H