
typedef unsigned char uint8_t;
typedef long int int32_t;
typedef int int16_t;
typedef unsigned int uint16_t;

#define START_BYTE 0x46
#define ADDR_SERVO1	0
#define ADDR_SERVO2	1

// commands 
#define GET_STATUS	0x00
#define GET_ABSPOS	0x01
#define SET_SYNCHRO	0x02

#define SET_CMD1	0x30
#define SET_CMD2	0x31
#define SET_CMD3	0x32

#define GET_PID		0x10
#define GET_LIMIT	0x11

#define SET_PID		0x40
#define SET_LIMIT	0x41

struct status_
{
	uint8_t status;
	int32_t position;
	int16_t force;
	int16_t current;
	uint16_t abspos;
}	__attribute__((__packed__));

struct abspos_
{
	int16_t abspos;
}	__attribute__((__packed__));


struct cmd_
{
	int32_t rd;
	uint16_t fd;
	uint16_t b;
	uint16_t t;
}	__attribute__((__packed__));

struct pid_
{
	int16_t p;
	int16_t i;
	int16_t d;
}	__attribute__((__packed__));

struct limit_
{
	int16_t u_limit;
	int16_t l_limit;
	int16_t cur_limit;
	int16_t f_limit;
}	__attribute__((__packed__));

struct synchro_
{
	uint16_t n;
}	__attribute__((__packed__));

union combuffer 
{
	struct cmd_ cmd;
	struct pid_ pid;
	struct limit_ limit;
	struct abspos_ abspos;
	struct status_ status;
	struct synchro_ synchro;
};
