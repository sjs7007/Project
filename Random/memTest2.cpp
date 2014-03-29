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
	ifstream in("testText");	
	while(in)
	{
		string line,tag;
		getline(in,line);	
		istringstream iss(line);
		for(int i=0;i<6;i++)
		{
			iss>>tag;
		}
		if(tag=="[heap]")	
		{
			getline(in,line);
			istringstream iss(line);
			iss>>line;
			iss>>line;
			cout<<line;
		}
		//cout<<tag<<x<<endl;
	}
	in.close();
	return;
}

