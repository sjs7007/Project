#include<stdio.h>
void main()
{
	int f=1,n=5,i;
	for(i=1;i<=n;i++)
	{
		f = f * i;
	}
	printf("Factorial of %d is : %d\n",n,f);
}
