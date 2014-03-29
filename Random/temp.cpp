#include<iostream>
#include<fstream>
#include<sstream>

using namespace std;

void getMemoryUsage();

int main()
{	
	 int a[10000];

	//printf("%d",sizeof(a));
	getMemoryUsage();
}

void getMemoryUsage()
{
	unsigned dataSegment=0,stackSegment=0,textSegment=0,sharedLib=0;
	
	ifstream in("/proc/self/status");	
	while(in)
	{
		string line,tag;
		getline(in,line);	
		istringstream iss(line);
		iss>>tag;
		if(tag=="VmData:")	
		{
			iss>>dataSegment;
		}
		else if(tag=="VmStk:")
		{
			iss>>stackSegment;
		}
		else if(tag=="VmExe:")
		{
			iss>>textSegment;
		}
		else if(tag=="VmLib:")
		{
			iss>>sharedLib;
			break;
		}

	}
	in.close();
	cerr<<"Memory used by Data Segment :  "<<dataSegment<<"KB.\n";
	cerr<<"Memory used by Stack Segment : "<<stackSegment<<"KB.\n";
	cerr<<"Memory used by Text Segment : "<<textSegment<<"KB.\n";
	cerr<<"Memory used by Shared Libraries : "<<sharedLib<<"KB.\n";
	unsigned total=dataSegment+stackSegment+textSegment+sharedLib;
	cerr<<"Total Memory Used  : "<<total<<"KB.\n";
	return;
}

