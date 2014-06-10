#include<stdio.h>
int main()
{
	int a[5]={3,4,5,6,7},i,prod[5];

	for(i=0;i<5;i++)
	{
		prod[i] = a[i] * 5;
	}

	for(i=0;i<5;i++)
	{
		printf("5 times %d is : %d \n",a[i],prod[i]);
	}
	return 0;
}
