#include <stdio.h>

typedef struct
{
	enum { INT,FLT } type;	

	union 
	{
		float fval;
		int ival;
	};
} Number;

int main()
{
	

	Number n;
	n.type=INT;
	n.ival=4;
	printf("Int val : %d \n",n.ival);
}
