#include <p33Fxxxx.h>

#include "config.h"

#define PERIOD (FCY/(UPDATE_RATE*8))-1

void initTIMER() {
    T1CONbits.TON = 0; // Disable Timer
    T1CONbits.TCS = 0; // Select external clock source
    T1CONbits.TSYNC = 0; // Enable Synchronization
    T1CONbits.TCKPS = 0b01; // Select 1:8 Prescaler
    TMR1 = 0x01; // Clear timer register
    PR1 = PERIOD; // 50000;  // Load the period value

    IPC0bits.T1IP = 3; // Set Timer1 Interrupt Priority Level
    IFS0bits.T1IF = 0; // Clear Timer1 Interrupt Flag
    IEC0bits.T1IE = 1; // Enable Timer1 interrupt
    T1CONbits.TON = 1; // Start Timer
}
