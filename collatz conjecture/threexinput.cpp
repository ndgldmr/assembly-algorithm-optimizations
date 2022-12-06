#include "timer.h"
#include <iostream>
using namespace std;
extern "C" int threexplusone(unsigned int x);
//Driver
int main() {
	//Let x = the positive integer to be used as input in threexplusone()
	unsigned int x;
	//Prompt the user to enter a positive integer
	cout << "Enter a number: ";
	cin >> x;
	//Let n = the number of interations for which threexplusone() should be ran
	unsigned int n;
	//Prompt the user to enter the number of iterations
	cout << "Enter iterations of subroutine: ";
	cin >> n;
	//Display the number of operations needed for x to converge to 1
	cout << "Steps: " << threexplusone(x) << endl;
	//Timer object to test the speed of threexplusone(x)
	timer time;
	//Start the timer
	time.start();
	//For each integer i from 1 to n
	for(int i = 1; i <= n; i++) {
		//Run threexplusone(x)
		threexplusone(x);
	}
	//Stop the timer
	time.stop();
	//Let averageTime = the average time (in milliseconds) it took threexplusone(x) to run n times
	double averageTime = (time.getTime() / n) * 1000;
	//End of main
	return 0;
}