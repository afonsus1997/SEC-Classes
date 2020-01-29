
#define deboucetm 393216
//#define deboucetm 262144



long debouncevar;
int loopAddr = 604;
//int sndAddr = 605;
int pushAddr = 602;


main(){
	
	long debouncevar = deboucetm;
	char * speed = (char*)loopAddr;
	char * push = (char*)pushAddr;
	// char * sound = (char*)sndAddr;
	char speedToWr = 0;
	char oldspeed = 0;
	//int soundToWr = 0;
	//int oldsound = 0;
	char lastpush = 0;

	*speed = 0;

	while(1){

		debouncevar = deboucetm;

		lastpush = *push; 

		if(lastpush == 2)				
			if(speedToWr != 7)
				speedToWr = oldspeed + 1;

		else if(lastpush == 1)
			if(speedToWr != 0)
				speedToWr = oldspeed - 1;

		
		
		//=================end check for loop time=================
		else if(lastpush == 5)
			speedToWr = 7;
		
		else if(lastpush == 6)
			speedToWr = 0;
		
		
		
		if(oldspeed != speedToWr){
			*speed = speedToWr;
			oldspeed = speedToWr;
		}
		/*if(oldsound != soundToWr){
			*sound = soundToWr;
			oldsound = soundToWr;
		}*/

		//debouce(deboucetm);
		while(debouncevar--);

		
	}	
		//return;
		/*else if(*push == 1){
			*speed = 6;			
		}*/

		while(1){}
	
	return 0;
	
}
