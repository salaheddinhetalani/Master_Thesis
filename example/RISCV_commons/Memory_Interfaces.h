//
// Created by tobias on 16.05.18.
//

#ifndef PROJECT_MEMORY_INTERFACES_H
#define PROJECT_MEMORY_INTERFACES_H

enum ME_MaskType {
    MT_X, MT_W, MT_H, MT_B, MT_HU, MT_BU
};

enum ME_AccessType {
    ME_X, ME_RD, ME_WR
};


struct COtoME_IF {
    ME_AccessType req;
    ME_MaskType mask;
    unsigned int addrIn;
    unsigned int dataIn;
};

struct MEtoCO_IF {
    unsigned int loadedData;
};

#endif //PROJECT_MEMORY_INTERFACES_H