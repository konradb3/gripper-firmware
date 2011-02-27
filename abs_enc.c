#include <p33Fxxxx.h>

////////////////////////////////////////////////////////////////////////////////
// Helper function read data from encoder
//

unsigned int getData() {
    int i, j;
    unsigned int data;
    for (i = 0; i < 100; ++i);
    _RA3 = 1;
    for (j = 0; j < 12; j++) {
        for (i = 0; i < 100; ++i);
        _RA3 = 0;
        for (i = 0; i < 100; ++i);
        _RA3 = 1;
        data <<= 1;
        data |= _RB7;
    }
    _RA3 = 0;
}

////////////////////////////////////////////////////////////////////////////////
// Read data from encoder
//

unsigned int getAbsEnc1() {
    unsigned int data;
    _RB3 = 1;
    data = getData();
    _RB3 = 0;
    return data;
}

////////////////////////////////////////////////////////////////////////////////
// Read data from encoder
//

unsigned int getAbsEnc2() {
    unsigned int data;
    _RB2 = 1;
    data = getData();
    _RB2 = 0;
    return data;
}

////////////////////////////////////////////////////////////////////////////////
// Read data from encoder
//

unsigned int getAbsEnc3() {
    unsigned int data;
    _RB1 = 1;
    data = getData();
    _RB1 = 0;
    return data;
}

////////////////////////////////////////////////////////////////////////////////
// Read data from encoder
//

unsigned int getAbsEnc4() {
    unsigned int data;
    _RB0 = 1;
    data = getData();
    _RB0 = 0;
    return data;
}
