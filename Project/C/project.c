
//#define deboucetm 393216
#define deboucetm 262144

/*volatile long freq[16] = {
	0x186A0,
	0x14585,
	0x11704,
	0xF424,
	0xD903,
	0xC350,
	0xB183,
	0xA2C2,
	0x963D,
	0x8B82,
	0x8235,
	0x7A12,
	0x72E3,
	0x6C81,
	0x66CB,
	0x61A8	
};
volatile long sweep[8] = {};

*/
volatile long debouncevar;
volatile long loopAddr = 2067;
volatile int pushAddr = 2065;

void debouce(long ticks){
	
	debouncevar = ticks;
	while(debouncevar--);
}


main(){
	
	volatile long * speed = (long*)loopAddr;
	volatile char * push = (char*)pushAddr;
	volatile char speedToWr = 0;
	volatile char oldspeed = 0;
	volatile char lastpush = 0;
	*speed = 0;


	while(1){
		lastpush = *push; 
		
		if(lastpush == 2){
			if(speedToWr == 7)
				speedToWr = oldspeed;
			else
				speedToWr = oldspeed + 1;
		}
		else if(lastpush == 1){
			if(speedToWr == 0)
				speedToWr = oldspeed;
			else
				speedToWr = oldspeed - 1;
		}
		else if(lastpush == 5)
			speedToWr = 7;
		else if(lastpush == 4)
			speedToWr = 0;

		if(oldspeed != speedToWr){
			*speed = speedToWr;
			oldspeed = speedToWr;
		}
		debouce(deboucetm);
		
	}	
		//return;
		/*else if(*push == 1){
			*speed = 6;			
		}*/

		while(1){}
	
	return 0;
	
}
