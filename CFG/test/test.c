#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int index,j;
	index=0;
	while(index<5)
	{
		j=index+1;
		while(j<5)
		{
			if(a[index]>=a[j])
			{
				int temp=a[index];
				a[index]=a[j];
				a[j]=temp;
			}
			j++;
		}
		index++;
	}
	printf("The sorted array using while loops is : ");
	for(index=0;index<5;index++)
	{
		printf("%d ",a[index]);
	}
	printf("\n");
}
