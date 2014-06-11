#include<stdio.h>

int main()
{
	int SIZE=10,i,j;

	for(i=0;i<SIZE;i++)
	{
		for(j=0;j<i;j++)
		{
			printf("*");
		}
		printf("\n");
	}

	for(i=0;i<SIZE;i++)
	{
		for(j=i;j>=0;j--)
		{
			printf("^");
		}
		printf("\n");
	}
	for(i=1;i<=SIZE;i++)
	{
		for(j=1;j<=i;j++)
		{
			printf("#");
		}
		printf("\n");
	}
	return 0;
}
