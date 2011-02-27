#include <p33Fxxxx.h>
#include <libq.h>

#include "control.h"
#include "pwm.h"
#include "qei.h"
#include "pwm.h"
#include "spi.h"
#include "config.h"

/** Arrays used in controler 1 **/
fractional abcCoefficient1[3] __attribute__((section(".xbss, bss, xmemory")));
fractional controlHistory1[3] __attribute__((section(".ybss, bss, ymemory")));

fractional ffParams1[3] __attribute__((section(".xbss, bss, xmemory")));
fractional ffControls1[3] __attribute__((section(".ybss, bss, ymemory")));

/** Arrays used in controler 2 **/
fractional abcCoefficient2[3] __attribute__((section(".xbss, bss, xmemory")));
fractional controlHistory2[3] __attribute__((section(".ybss, bss, ymemory")));

fractional ffParams2[3] __attribute__((section(".xbss, bss, xmemory")));
fractional ffControls2[3] __attribute__((section(".ybss, bss, ymemory")));

/** controllers structures **/
tController control1;
tController control2;

inline void positionControl(tController *c);
inline void controlLoop(tController* c);

void __attribute__((interrupt, no_auto_psv)) _T1Interrupt(void) {
    //-----------------------------------------------------------------------//

    // get data from hardware
#ifdef MIRROR
    control1.fm = 3644 - getAbsEnc2();
    control1.abspos = getAbsEnc1();
#else
    control1.fm = 3644 - getAbsEnc4();
    control1.abspos = getAbsEnc3();
#endif 
    control1.position = (long int) control1.index * 1024 + (long int) POS1CNT;

    controlLoop(&control1);
    if (control1.mode != MODE_STOP)
        setPWM1(control1.posPID.controlOutput);
    else
        setPWM1(0);

    //-----------------------------------------------------------------------//

    //-----------------------------------------------------------------------//

    // get data from hardware

#ifdef MIRROR
    control2.fm = getAbsEnc4() - 3644;
    control2.abspos = getAbsEnc3();
#else
    control2.fm = getAbsEnc2() - 3644;
    control2.abspos = getAbsEnc1();
#endif 
    control2.position = (long int) control2.index * 1024 + (long int) POS2CNT;

    controlLoop(&control2);
    if (control2.mode != MODE_STOP)
        setPWM2(control2.posPID.controlOutput);
    else
        setPWM2(0);

    //-----------------------------------------------------------------------//


    IFS0bits.T1IF = 0; //Clear Timer1 interrupt flag
}

inline void positionControl(tController *c) {
    c->posPID.measuredOutput = (c->setpoint - c->position);

    PID(&(c->posPID)); // do pid

    // limit output current
    if (c->posPID.controlOutput > 4000)
        c->posPID.controlOutput = 4000;
    if (c->posPID.controlOutput<-4000)
        c->posPID.controlOutput = -4000;
}

void controlLoop(tController* c) {

    int rc;

    if ((c->redy) && (c->t > c->tt)) {
        c->fd = c->cmd_fd;
        c->b = c->cmd_b;
        c->tt = c->cmd_t;
        c->t = 1;
        if (c->cmd == 1) {
            c->rd = c->cmd_rd;
            c->mode = MODE_VELLOCITY;
        } else if (c->cmd == 2) {
            c->t_pos = c->cmd_pos;
            c->mode = MODE_POSITION;
        } else if (c->cmd == 3) {
            c->t_pos = c->cmd_pos - c->position;
            c->mode = MODE_POSITION;
        }
        c->redy = 0;
    }

    // current limit
    if (c->current > c->current_limit)
        c->mode = MODE_STOP;

    switch (c->mode) {
        case MODE_STOP:
            break;
        case MODE_POSITION:
            c->rd = ((c->t_pos * (c->t)) / c->tt) - ((c->t_pos * (c->t - 1)) / c->tt);
        case MODE_VELLOCITY:

            if (c->fm > c->m_limit) {
                c->status |= (1 << TORQUE_LIMIT);
                c->fm = c->m_limit;
            }

            rc = (c->b * (c->fm - c->fd)) / 100 + c->rd;

            //	if((rc > 0)&&(rc > c->rc_limit))
            //		rc = c->rc_limit;
            //if((rc < 0)&&(rc < -c->rc_limit))
            //	rc = -c->rc_limit;

            if (c->t > c->tt)
                rc = 0;
            else ++c->t;

            if ((c->abspos < c->l_limit)) {
                c->status |= (1 << LOWER_LIMIT);
                if (c->inv) {
                    if (rc > 0)
                        rc = 0;
                } else {
                    if (rc < 0)
                        rc = 0;
                }
            } else if ((c->abspos > c->u_limit)) {
                c->status |= (1 << UPPER_LIMIT);
                if (c->inv) {
                    if (rc < 0)
                        rc = 0;
                } else {
                    if (rc > 0)
                        rc = 0;
                }
            }

            c->setpoint += rc;

            positionControl(c);
            break;
    }

}

inline void setPIDParams(tController* c, int p, int i, int d) {

    c->kCoeffs[0] = p;
    c->kCoeffs[1] = i;
    c->kCoeffs[2] = d;

    PIDInit(&c->posPID);
    PIDCoeffCalc(&(c->kCoeffs[0]), &c->posPID); /*Derive the a,b, & c coefficients from the Kp, Ki & Kd */
}

inline void initControl() {
    /* Initialize controller 1 */

    // setup position PID
    control1.posPID.abcCoefficients = &abcCoefficient1[0];
    control1.posPID.controlHistory = &controlHistory1[0];

    PIDInit(&control1.posPID);

    control1.kCoeffs[0] = Q15(0.2);
    control1.kCoeffs[1] = Q15(0.0000);
    control1.kCoeffs[2] = Q15(0.00);

    PIDCoeffCalc(&(control1.kCoeffs[0]), &control1.posPID);

    // setup parameters

    control1.u_limit = 4096;
    control1.l_limit = 0;

    control1.current_limit = 4000;

    control1.b = 0;
    control1.rd = 0;
    control1.mode = MODE_POSITION;

    control1.cmd = 0;
    control1.t = 1;
    control1.tt = 0;
    control1.rc_limit = 50;
    control1.m_limit = 150;
    control1.redy = 0;

    control1.inv = 1;
    /* Initialize controller 2 */

    // setup position PID
    control2.posPID.abcCoefficients = &abcCoefficient2[0];
    control2.posPID.controlHistory = &controlHistory2[0];

    PIDInit(&control2.posPID);

    control2.kCoeffs[0] = Q15(0.2);
    control2.kCoeffs[1] = Q15(0.0000);
    control2.kCoeffs[2] = Q15(0.00);

    PIDCoeffCalc(&(control2.kCoeffs[0]), &control2.posPID);

    // setup parameters

    control2.u_limit = 4096;
    control2.l_limit = 0;

    control2.current_limit = 4000;

    control2.b = 0;
    control2.rd = 0;
    control2.mode = MODE_POSITION;

    control2.cmd = 0;
    control2.t = 1;
    control2.tt = 0;
    control2.rc_limit = 50;
    control2.m_limit = 150;
    control2.redy = 0;

    control2.inv = 0;
}
