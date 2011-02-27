#ifndef CONTROL_H
#define CONTROL_H

#include <dsp.h>

#define MODE_STOP       0
#define MODE_PWM        1
#define MODE_CURRENT    2
#define MODE_VELLOCITY  3
#define MODE_POSITION   4

#define LOWER_LIMIT     0
#define UPPER_LIMIT     1
#define CURRENT_LIMIT   2
#define TORQUE_LIMIT    3

void initControl();

int getSpead1();
int getSpead2();
void setSpead1(int spead);
void setSpead2(int spaed);
void setMode1(char mod);
void setMode2(char mode);
char getMode1();
char getMode2();
char getStatus1();
char getStatus2();

typedef struct {
    //** Regulator data **//

    tPID posPID;

    //** Config data **//
    int u_limit; // upper position limit in units of absolute encoder
    int l_limit; // lower position limit in units of absolute encoder

    int current_limit;

    int m_limit;

    int rc_limit;

    int kCoeffs[3];

    int rd;
    int fd;
    int b;

    int mode;

    int current;
    int fm;
    long int position;
    unsigned int abspos;

    int status;

    int index;

    long int setpoint;

    int t;

    int tt;

    long int t_pos;

    // cmd data
    int cmd;
    int cmd_rd;
    int cmd_fd;
    int cmd_b;
    long int cmd_pos;
    int cmd_t;

    int redy;

    int inv;

} tController;

#endif // CONTROL_H
