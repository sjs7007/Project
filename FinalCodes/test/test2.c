//Sorting using for loop

#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int index=0,j;
	
	//for(index=0;index<5;index++)
	while(index<5)
	{
		//for(j=index+1;j<5;j++)
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
	printf("The sorted array is : ");
	for(index=0;index<5;index++)
	{
		printf("%d ",a[index]);
	}
	printf("\n");
}
