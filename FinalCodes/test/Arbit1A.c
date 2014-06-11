#include<stdio.h>

int main()
{
	int a[100][100],i=1,j=1; //array size cannot be variable in C, therefore 100
	
	int SIZE=10;

	for(i=0;i<SIZE;i++)
	{
		for(j=0;j<SIZE;j++)
		{
			a[i][j]=0;
		}
	}
	a[1][1]=1;
	for(i=2;i<=SIZE;i++)
	{
		for(j=1;j<=i;j++)
		{
			a[i][j]=a[i-1][j-1]+a[i-1][j];
		}
	}
	for(i=1;i<=SIZE;i++)
	{
		for(j=1;j<=i;j++)
		{
			printf("%d ",a[i][j]);
		}
		printf("\n");
	}
	return 0;
}
