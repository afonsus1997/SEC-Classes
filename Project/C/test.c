
//#define MILSPERCLOCK 32768
// #define deboucetm 65536
#define deboucetm 1048576


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
				speedToWr = 0;
			else
				speedToWr = 7;
			//else *speed = *speed++;
		}
		else if(lastpush == 2)
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
