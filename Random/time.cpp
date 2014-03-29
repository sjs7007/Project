#include<iostream>
using namespace std;
#include<time.h>

int main()
{
	clock_t starttime = clock();
	int x;
	cin>>x;
	clock_t endtime = clock();
	//unsigned runtime = (unsigned) ((1000.0f * (endtime - starttime)) / CLOCKS_PER_SEC);
	unsigned runtime = ((float)(endtime-starttime))/CLOCKS_PER_SEC;
	cout << "time=" << runtime << endl;
}
