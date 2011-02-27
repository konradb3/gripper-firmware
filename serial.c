#include <p33Fxxxx.h>

#include	"serial.h"
#include	"qei.h"
#include	"pwm.h"
#include	"uart.h"
#include	"control.h"
#include	"config.h"

////////////////////////////////////////////////////////////////////////////////
// External global variables.
//

extern tController control1;
extern tController control2;

////////////////////////////////////////////////////////////////////////////////
// Interpret received instruction
//

void interpretInstruction(char* b) {
    union combuffer* s = (union combuffer*)&b[3];

    if (b[1] == 0) {
        switch (b[2]) {
            case GET_STATUS:
                s->status.status = control1.status;
                s->status.position = control1.position;
                s->status.force = control1.fm;
                s->status.current = control1.current;
                s->status.abspos = control1.abspos;
                writeUART(b, 14);
                control1.status = 0;
                break;

            case GET_ABSPOS:
                s->abspos.abspos = control1.abspos;
                control1.mode = MODE_STOP;
                POS1CNT = 0;
                control1.index = 0;
                control1.position = 0;
                control1.setpoint = 0;
                PIDInit(&control1.posPID);
                writeUART(b, (3 + sizeof (struct abspos_)));
                break;

            case GET_PID:
                s->pid.p = control1.kCoeffs[0];
                s->pid.i = control1.kCoeffs[1];
                s->pid.d = control1.kCoeffs[2];
                writeUART(b, (3 + sizeof (struct pid_)));
                break;

            case SET_PID:
                setPIDParams(&control1, s->pid.p, s->pid.i, s->pid.d);
                break;

            case SET_LIMIT:
                control1.u_limit = s->limit.u_limit;
                control1.l_limit = s->limit.l_limit;
                control1.current_limit = s->limit.cur_limit;
                control1.m_limit = s->limit.f_limit;
                break;

            case GET_LIMIT:
                s->limit.l_limit = control1.l_limit;
                s->limit.u_limit = control1.u_limit;
                s->limit.cur_limit = control1.current_limit;
                s->limit.f_limit = control1.m_limit;
                ;
                writeUART(b, (3 + sizeof (struct limit_)));
                break;

            case SET_CMD1:
                control1.cmd_b = s->cmd.b;
                control1.cmd_t = s->cmd.t;
                control1.cmd_fd = s->cmd.fd;
                control1.cmd_rd = s->cmd.rd;
                control1.cmd = 1;
                break;

            case SET_CMD2:
                control1.cmd_b = s->cmd.b;
                control1.cmd_t = s->cmd.t;
                control1.cmd_fd = s->cmd.fd;
                control1.cmd_pos = s->cmd.rd;
                control1.cmd = 2;
                break;

            case SET_CMD3:
                control1.cmd_b = s->cmd.b;
                control1.cmd_t = s->cmd.t;
                control1.cmd_fd = s->cmd.fd;
                control1.cmd_pos = s->cmd.rd;
                control1.cmd = 3;
                break;

        }
    } else if (b[1] == 1) {
        switch (b[2]) {
            case GET_STATUS:
                s->status.status = control2.status;
                s->status.position = control2.position;
                s->status.force = control2.fm;
                s->status.abspos = control2.abspos;
                writeUART(b, 14);
                control2.status = 0;
                break;

            case GET_ABSPOS:
                s->abspos.abspos = control2.abspos;
                control2.mode = MODE_STOP;
                POS2CNT = 0;
                control2.index = 0;
                control2.position = 0;
                control2.setpoint = 0;
                PIDInit(&control2.posPID);
                writeUART(b, (3 + sizeof (struct abspos_)));
                break;

            case GET_PID:
                s->pid.p = control2.kCoeffs[0];
                s->pid.i = control2.kCoeffs[1];
                s->pid.d = control2.kCoeffs[2];
                writeUART(b, (3 + sizeof (struct pid_)));
                break;

            case SET_PID:
                setPIDParams(&control2, s->pid.p, s->pid.i, s->pid.d);
                break;

            case SET_LIMIT:
                control2.u_limit = s->limit.u_limit;
                control2.l_limit = s->limit.l_limit;
                control2.current_limit = s->limit.cur_limit;
                control2.m_limit = s->limit.f_limit;
                break;

            case GET_LIMIT:
                s->limit.l_limit = control2.l_limit;
                s->limit.u_limit = control2.u_limit;
                s->limit.cur_limit = control2.current_limit;
                s->limit.f_limit = control2.m_limit;
                ;
                writeUART(b, (3 + sizeof (struct limit_)));
                break;

            case SET_CMD1:
                control2.cmd_b = s->cmd.b;
                control2.cmd_t = s->cmd.t;
                control2.cmd_fd = s->cmd.fd;
                control2.cmd_rd = s->cmd.rd;
                control2.cmd = 1;
                break;

            case SET_CMD2:
                control2.cmd_b = s->cmd.b;
                control2.cmd_t = s->cmd.t;
                control2.cmd_fd = s->cmd.fd;
                control2.cmd_pos = s->cmd.rd;
                control2.cmd = 2;
                break;

            case SET_CMD3:
                control2.cmd_b = s->cmd.b;
                control2.cmd_t = s->cmd.t;
                control2.cmd_fd = s->cmd.fd;
                control2.cmd_pos = s->cmd.rd;
                control2.cmd = 3;
                break;

        }
    } else if (b[1] = 255) {
        if (b[2] == SET_SYNCHRO) {
            control1.cmd_t = control1.cmd_t - (s->synchro.n - control1.t);
            control2.cmd_t = control2.cmd_t - (s->synchro.n - control2.t);
            control1.redy = 1;
            control2.redy = 1;
        }
    }
}
