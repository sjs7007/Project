#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int i,j;
	for(i=0;i<5;i++)
	{
		for(j=i+1;j<5;j++)
		{
			if(a[i]>=a[j])
			{
				int temp=a[i];
				a[i]=a[j];
				a[j]=temp;
			}
		}
	}
	printf("The sorted array is : ");
	for(i=0;i<5;i++)
	{
		printf("%d ",a[i]);
	}
	printf("\n");
}
