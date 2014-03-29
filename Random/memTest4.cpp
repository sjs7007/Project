#include<iostream>
#include<fstream>
#include<sstream>

using namespace std;

int getMemoryUsage();
int getMemoryUsageHeap();

int main()
{	
	int a[21024];
	int total=0;
	total=getMemoryUsage()+getMemoryUsageHeap();
	cout<<"Total Memory Used  : "<<total<<"KB.\n";
}

int getMemoryUsage()
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
	return total;
}

int getMemoryUsageHeap()
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
	cerr<<"Memory used by Heap = "<<x<<"KB.\n";
	return x;
}

