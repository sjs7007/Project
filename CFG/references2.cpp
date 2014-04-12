//convert int,float,double to string - WORKS
#include <iostream>
using namespace std;
#include <sstream>

int main()
{
	int a=5;
	float f=5.5;
	double d =6.77;
	ostringstream ss;
	ss<<a<<" "<<d<<" "<<f;
	string s=ss.str();
	cout<<s<<endl;
}

//http://stackoverflow.com/questions/5590381/easiest-way-to-convert-int-to-string-in-c