#ifndef UART_H
#define UART_H

void InitUART1(void);
void InitDMA(void);
void WriteUART1(char *buf, unsigned int len);
void ReadUART1(char *buf, unsigned int len);

#endif // UART_H
