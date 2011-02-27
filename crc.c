#include <p33Fxxxx.h>
/*
void InitCRC()
{

	_CSIDL = 1;
	_VWORD = 16; // set 8 bit 16 deep fifo
	_CRCGO = 0;
	_PLEN = 7;
	CRCXOR = 0x07; // use x8  + x2  + x + 1 
	CRCWDAT = 0x00; 

}

char CalcCRC(char *buf, int len)
{
	int i;

	CRCWDAT = 0x00;
	for (i=0;i<len;i++)
	{
		CRCDAT = buf[i];
		if(CRCCONbits.CRCFUL)
		{
			CRCCONbits.CRCGO = 1; 
		}
		while(CRCCONbits.CRCFUL); /
	}
	CRCDAT = 0x00;

	while(!CRCCONbits.CRCMPT);
	return CRCWDAT; 
}
*/
