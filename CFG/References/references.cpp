#include <stdio.h>
#include <iostream>
#include <math.h>
#include <stdlib.h>
using namespace std;

//http://www.tutorialspoint.com/cplusplus/cpp_strings.htm strings
//http://pages.cs.wisc.edu/~hasti/cs368/CppTutorial/NOTES/STRING.html

struct Number
    {
        string floatString; //store float of base e as string, use function to convert it later to float value
        enum { INTEGER, FLOAT } type;
        union
        {
            float fval;
            int   ival;
        };

        float getFloat(string s)
        {
            int pos = s.find("e");

            cout<<pos<<endl;
            
            string number = s.substr(0,pos);
            cout<<number<<endl;

            string power = s.substr(pos+1,s.length()-(pos+1));
            cout<<power<<endl;

            float floatVal = atof(number.c_str()) * pow(10,atoi(power.c_str()));
            cout<<floatVal<<endl;
            return floatVal;
        }

    };

int main()
{
	
	Number n;
	n.type=n.INTEGER;
	n.ival=3;
	int a=4,b=5;

	cout<<((n.type==n.INTEGER) ? n.ival  :n.fval)<<endl;

    n.floatString ="4.554000091552734375e+1";
    cout<<n.floatString<<endl;
    n.fval = n.getFloat(n.floatString);
    cout<<n.fval<<endl;

    /*
    string s = "4.554000091552734375e+1";
    int pos = s.find("e");

    cout<<pos<<endl;
    
    string number = s.substr(0,pos);
    cout<<number<<endl;

    string power = s.substr(pos+1,s.length()-(pos+1));
    cout<<power<<endl;

    float floatVal = atof(number.c_str()) * pow(10,atoi(power.c_str()));
    cout<<floatVal<<endl;
    */
}
