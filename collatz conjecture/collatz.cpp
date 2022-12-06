#include <iostream>
using namespace std;
//Implements the collatz conjecture for a positive integer n.
//Returns an integer representing the number of operations needed for n to converge to 1. 
int collatz(unsigned int n) {
	//Base Case: If n = 1
	if(n == 1) {
		//Return 0
		return 0;
	}
	//Recursive Case: If n != 0
	else {
		//If n is positive
		if(n % 2 == 0) {
			//Return 1 + the result of collatz(n / 2)
			return 1 + collatz(n / 2);
		}
		//If n is not positive
		else if(n % 2 != 0) {
			//Return 1 + the result of collatz(3n + 1)
			return 1 + collatz((3 * n) + 1);
		}
	}
}
//Driver 
int main() {
	//Let n = the positive integer to be used as input in collatz()
	unsigned int n;
	//Prompt the user to enter a positive integer
	cout << "Enter a positive integer: ";
	cin >> n;
	cout << "It takes " << collatz(n) << " operations for " << n << " to converge to 1." << endl;
	//End of main
	return 0;
}