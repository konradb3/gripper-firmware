
#include <p33Fxxxx.h>

#include "config.h"
#include "pwm.h"
#include <dsp.h>
#include "control.h"

#define  NUM_CHS2SCAN			2		// Number of channels enabled for channel scan

extern tController control1;
extern tController control2;

extern int data1[512];
extern int data[512];
extern int data2[512];
extern int i;

int iii = 0;

/*=============================================================================
ADC INITIALIZATION FOR CHANNEL SCAN
=============================================================================*/
void InitADC(void) {

    AD1CON1bits.FORM = 0b10; // Data Output Format: Unsigned Fractional
    AD1CON1bits.SSRC = 2; // Sample Clock Source: pwm event starts conversion
    AD1CON1bits.ASAM = 1; // ADC Sample Control: Sampling begins immediately after conversion
    AD1CON1bits.AD12B = 1; // 12-bit ADC operation
    AD1CON1bits.SSRC = 0b011;
    AD1CON2bits.CSCNA = 1; // Scan Input Selections for CH0+ during Sample A bit
    AD1CON2bits.CHPS = 0; // Converts CH0

    AD1CON3bits.ADRC = 0; // ADC Clock is derived from Systems Clock
    AD1CON3bits.ADCS = 100; // ADC Conversion Clock

    AD1CON2bits.SMPI = (NUM_CHS2SCAN - 1); // 2 ADC Channel is scanned

    //AD1CSSH/AD1CSSL: A/D Input Scan Selection Register
    AD1CSSLbits.CSS0 = 1; // Enable AN0 for channel scan
    AD1CSSLbits.CSS1 = 1; // Enable AN1 for channel scan

    //AD1PCFGH/AD1PCFGL: Port Configuration Register
    AD1PCFGL = 0xFFFF;
    AD1PCFGLbits.PCFG0 = 0; // AN0 as Analog Input
    AD1PCFGLbits.PCFG1 = 0; // AN1 as Analog Input

    IPC3bits.AD1IP = 7;
    IFS0bits.AD1IF = 0; // Clear the A/D interrupt flag bit
    IEC0bits.AD1IE = 1; // Enable A/D interrupt
    AD1CON1bits.ADON = 1; // Turn on the A/D converter

}

/*=============================================================================  
ADC INTERRUPT SERVICE ROUTINE
=============================================================================*/

int scanCounter = 1;

void __attribute__((interrupt, no_auto_psv)) _ADC1Interrupt(void) {
    switch (scanCounter) {
        case 0:
            control1.current = ADC1BUF0 >> 2;
            break;
        case 1:
            control2.current = ADC1BUF0 >> 2;
            break;
    }

    scanCounter ^= 1;

    IFS0bits.AD1IF = 0; // Clear the ADC1 Interrupt Flag

}

