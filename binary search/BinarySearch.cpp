#include <iostream>
using namespace std; 
/**
 * Performs binary search on a sorted array of integers.
 * Parameters: 
 * 	(1) A sorted array of integers
 * 	(2) An integer representing the left-most index of the array
 *  (3) An integer representing the right-most index of the array
 * 	(4) The target element to be found in the array
 * Return: The index of the target element if found, and -1 if otherwise
*/
int binarysearch(int array[], int left, int right, int target) {
	//Let middle = the middle index of the array
	int middle = (left + right) / 2;
	//Base Case: If target = array[middle]
	if(target == array[middle]) {
		//Return middle
		return middle;
	}
	//Recursive Case 1: If target < array[middle]
	else if(target < array[middle]) {
		//Search for the target in indices left...middle-1
		return binarysearch(array, left, middle - 1, target);
	}
	//Recursive Case 2: If target > array[middle]
	else if(target > array[middle]) {
		//Search for the target in indices middle+1...right
		return binarysearch(array, middle + 1, right, target);
	}
	//Default Case: The target has not been found in the array
	else {
		//Return -1
		return -1;
	}
}

//Driver
int main() {
	cout << "Test";
	//Array of integers for binarysearch() input
	int array[] = {1, 2, 3, 4, 5};
	//Print the result of binarysearch()
	cout << binarysearch(array, 0, 4, 6);
	//End of main
	return 0;
}