#include <sstream>
#include <iostream>
using namespace std;

int main()
{
	const int i = 3;
	ostringstream s;
	s << i;
	cout<<s<<endl;
	string i_as_string(s.str());
	cout<<i_as_string<<endl;
}
