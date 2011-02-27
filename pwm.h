#ifndef PWM_H
#define PWM_H

#define PWM2_DIR	_RB12
#define PWM1_DIR	_RB14

void initPWM(void);
inline void setPWM1(int pwm);
inline void setPWM2(int pwm);

#endif // PWM_H
