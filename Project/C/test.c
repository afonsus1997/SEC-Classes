
#define deboucetm 393216
//#define deboucetm 262144



long debouncevar;
int loopAddr = 604;
int pushAddr = 602;

void debouce(long ticks){
	
	debouncevar = ticks;
	while(debouncevar--);
}


main(){
	
	char * speed = (char*)loopAddr;
	char * push = (char*)pushAddr;
	char speedToWr = 0;
	char oldspeed = 0;
	char lastpush = 0;
	*speed = 0;

	while(1){
		lastpush = *push; 
		
		if(lastpush == 1){
			if(speedToWr == 7)
				speedToWr = oldspeed;
			else
				speedToWr = oldspeed + 1;
		}
		else if(lastpush == 2){
			if(speedToWr == 0)
				speedToWr = oldspeed;
			else
				speedToWr = oldspeed - 1;
		}
		else if(lastpush == 4)
			speedToWr = 7;

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
