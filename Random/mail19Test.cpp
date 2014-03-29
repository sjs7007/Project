//Program containing test function

#include <fstream>
#include <iostream>
using namespace std;

int testFunction(int x);

int main()
{
	testFunction(10);
}

int testFunction(int x)
{
	int temp = x * 10;
	cout<<"Returned value is "<<temp<<endl;
	return temp;
}


