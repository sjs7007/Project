#include<stdio.h>
int main()
{
	int a[5],i,prod[5];

	for(i=0;i<5;i++)
	{
		scanf("%d",&a[i]);
	}

	printf("The numbers entered are :- \n");

//	for(i=0;i<5;i++)
//	{
//		printf("%d ",a[i]);
//	}
	printf("\n");

	for(i=0;i<5;i++)
	{
		prod[i] = a[i] * 5;
	}

//	for(i=0;i<5;i++)
//	{
//		printf("5 times %d is : %d \n",a[i],prod[i]);
//	}
	return 0;
}
