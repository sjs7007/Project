//from popentest7.cpp, some comments removed.

#include <iomanip>
#include <iostream>
#include <stdio.h> //for popen,fgets
#include <stdlib.h> //for atoi
#include <sstream> //for using ostringstream while converting int to string
#include <math.h> //for power function

using namespace std;

const int Max_Buffer = 255;

int getOutput(string commandInput);
string toString(int x);
bool compareExecutables(string cmd1,string cmd2,int nTestCases); //executable1,executable2, number of test cases
double confidenceValue(int n);

int main(int argc, char* argv[])
{
	string cmd1=(argv[1]);
	string cmd2=(argv[2]);
	cmd1.append(" ");
	cmd2.append(" ");
	int n = atoi(argv[3]);
	compareExecutables(cmd1,cmd2,n); 
	confidenceValue(n);
}

int getOutput(string commandInput) //run given command and return its stdout converted as int type
{
	string temp;
	int output;
	char buffer[Max_Buffer];
	FILE *stream = popen(commandInput.c_str(),"r");
	while( fgets(buffer,Max_Buffer,stream)!=NULL )
	{
		temp.append(buffer);
	}
	pclose(stream);
	output=atoi(temp.c_str()); //convert string to int
	return output;
}

string toString(int x) //return int converted to std::string
{
	ostringstream s; //Read comments below
	s << x; // Inser integter into output stream
	string converted(s.str()); // str() used to access the sequence of characters of ostringstream as a string object
	return converted;
}

bool compareExecutables(string ip1,string ip2,int nTestCases)
{
	int flag = 0;
	
	for(int i=0;i<nTestCases;i++)
	{	
		string cmd1=ip1,cmd2=ip2;
		
		cmd1= cmd1.append(toString(i));
		cmd2= cmd2.append(toString(i));
		
		int temp1 = getOutput(cmd1.c_str());
		int temp2 = getOutput(cmd2.c_str());
		cout<<temp1<<" "<<temp2<<endl;

		if(temp1!=temp2)
		{
			flag=1;
			cout<<"Failed for test case i= "<<i<<"."<<endl;
			break;
		}
	}
	if(flag==0)
	{
		cout<<"Passed for all "<<nTestCases<<" test cases."<<endl;
		return false; //the functions are not same
	}
	else
	{
		return true; //the functions are same
	}
}

double confidenceValue(int n)
{
	double temp = 1;
	temp = temp - pow(2,-n);
	cout<<"Confidence Value calculated as 1 - (1/2^n) : "<<temp<<endl;
	return temp;
}

