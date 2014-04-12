#include<stdio.h>
void main()
{
	int _fac109 =1,n=5,i;
	for(i=2;i<=n;i++)
	{
		n = 3 * 3 + 1 * 1 + -1 + 2*n+ -_fac109;
	}
	//printf("%d,d\n",n,_fac109 );
}
