
#define MILSPERCLOCK 32768

int loopAddr = 604;
int pushAddr = 602;

void delay(int miliseconds){
	int y;
	y = miliseconds*MILSPERCLOCK;
	while(y--);
}


void main(){
	
	int * speed = (int*)loopAddr;
	int * push = (int*)pushAddr;

	


	while(1){
		if(*push == 0){
			*speed = 6;			
		}
		else{
			*speed = 1;		
		}
	}
	return;
}
