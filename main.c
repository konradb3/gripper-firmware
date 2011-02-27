#define __sdPIC33F__

#include <p33Fxxxx.h>

#include	"uart.h"
#include	"qei.h"
#include	"pwm.h"
#include	"timer.h"
#include	"spi.h"
#include	"adc.h"
#include	"control.h"

//_FOSC(FCKSM_CSECMD & OSCIOFNC_OFF & POSCMD_XT);
//_FWDT( FWDTEN_OFF );

_FOSC(FCKSM_CSECME & OSCIOFNC_ON & POSCMD_NONE & IOL1WAY_OFF);
_FWDT(FWDTEN_OFF);

void initIO() {
    _TRISA2 = 0;
    _ODCA2 = 0;
    _RA2 = 0;

    _U1RXR = 4; // connect UART rx to RP7
    _RP5R = 3; // connect UART tx to RP6

    //QEI1
    _QEA1R = 10;
    _QEB1R = 11;

    //QEI2
    _QEA2R = 8;
    _QEB2R = 9;

    /* absEnc Chip Select */
    //CS0
    _TRISB3 = 0;
    _ODCB3 = 0;
    _RB3 = 0;

    //CS1
    _TRISB2 = 0;
    _ODCB2 = 0;
    _RB2 = 0;

    //CS2
    _TRISB1 = 0;
    _ODCB1 = 0;
    _RB1 = 0;

    //CS3
    _TRISB0 = 0;
    _ODCB0 = 0;
    _RB0 = 0;

    //CLK
    _TRISA3 = 0;
    _ODCA3 = 0;
    _RA3 = 0;

    //DI
    _TRISB7 = 1;
    _ODCB7 = 0;
    //_RA3 	= 	0;

}

////////////////////////////////////////////////////////////////////////////////
// Initialize device PLL
//

void initClock() {
    PLLFBD = 41; // M = 43
    CLKDIVbits.PLLPOST = 0; // N1 = 2
    CLKDIVbits.PLLPRE = 0; // N2 = 2
    OSCTUN = 0;
    RCONbits.SWDTEN = 0;

    // Clock switch to incorporate PLL
    __builtin_write_OSCCONH(0x01); // Initiate Clock Switch to
    // FRC with PLL (NOSC=0b001)
    __builtin_write_OSCCONL(0x01); // Start clock switching

    // disable two next lines when emulating in proteus VMS
    while (OSCCONbits.COSC != 0b001); // Wait for Clock switch to occur
    while (OSCCONbits.LOCK != 1) {
    };
}

int main() {
    initClock();
    initIO();
    initControl();
    initUART1();
    initQEI();
    initPWM();
    //	InitADC();
    initTIMER();

    while (1);

    return 0;
}
