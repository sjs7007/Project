#include<iostream>
#include<fstream>
#include<sstream>

using namespace std;

void getMemoryUsageHeap();

int main()
{	
	/*int a[10000];
	int k[10000];
	int l[10000];
	int p[10000];
	int c,d,e,f;*/
	int i,n;
  int * p;
  cout << "How many numbers would you like to type? ";
  i=512;
  p= new (nothrow) int[i];
	getMemoryUsageHeap();
}

void getMemoryUsageHeap()
{
	unsigned x=0;
	ifstream in("/proc/self/smaps");	
	while(in)
	{
		string line,tag,temp;
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
			iss>>temp;
			iss>>x;
			break;
		}
	}
	in.close();
	cerr<<"Memory used by heap = "<<x<<"KB.\n";
	return;
}

