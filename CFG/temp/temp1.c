#include <stdio.h>

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
	n.fval=4.5;
	n.ival=3;
	printf("%d %f /n",n.ival,n.fval);

}
