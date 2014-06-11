//Level 5 : Check array Support 

#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int index,j;
	for(index=0;index<5;index++)
	{
		for(j=index+1;j<5;j++)
		{
			if(a[index]>=a[j])
			{
				int temp=a[index];
				a[index]=a[j];
				a[j]=temp;
			}
		}
	}
	printf("The sorted array is : ");
	for(index=0;index<5;index++)
	{
		printf("%d ",a[index]);
	}
	printf("\n");
}
