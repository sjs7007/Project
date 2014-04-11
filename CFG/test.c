#include<stdio.h>
void main()
{
	int _fac109 =1,n=5,i;
	for(i=1;i<=n;i++)
	{
	 _fac109  = _fac109  * i;
	}
	printf("Factorial of %d is : %d\n",n,_fac109 );
}
