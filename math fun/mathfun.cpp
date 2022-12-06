#include <iostream>
#include <time.h>
#include <cstdlib>
using namespace std; 
//Use C naming conventions in the object files for the product and power routines. 
extern "C" int product(int x, int y); 
extern "C" int power(int x, int y);
//Driver 
int main() {
	//Let x and y = the positive integers for which the product and power will be computed. 
	int x; 
	int y;
	//Prompt the user to enter the first integer. 
	cout << "Enter integer 1: "; 
	cin >> x; 
	//Prompt the user to enter the second integer. 
	cout << "Enter integer 2: "; 
	cin >> y; 
	//Display the results of product(x, y) and power(x, y).
	cout << "Product: " << product(x, y) << endl;
	cout << "Power: " << power(x, y) << endl;
}