#include <stdio.h>
#include <iostream>
using namespace std;

 struct Number
    {
        enum { INTEGER, FLOAT } type;
        union
        {
            float fval;
            int   ival;
        };
    };


int main()
{
	
	Number n;
	n.type=n.INTEGER;
	n.ival=3;
	int a=4,b=5;

	cout<<((n.type==n.INTEGER) ? n.ival  :n.fval);

}
