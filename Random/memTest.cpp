#include<iostream>
#include<fstream>
#include<sstream>

using namespace std;

void getMemoryUsage();

int main()
{	
	/*int a[10000];
	int k[10000];
	int l[10000];
	int p[10000];
	int c,d,e,f;*/
	getMemoryUsage();
}

void getMemoryUsage()
{
	unsigned x=0;
	ifstream in("/proc/self/status");	
	while(in)
	{
		string line,tag;
		getline(in,line);	
		istringstream iss(line);
		iss>>tag;
		if(tag=="VmData:")	
		{
			iss>>x;
			break;
		}
	}
	in.close();
	cerr<<"Memory = "<<x<<"KB.\n";
	return;
}

