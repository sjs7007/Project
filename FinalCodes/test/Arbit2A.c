// Search for element in an array

#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int index,j,find=4,loc=-1;
	for(index=0;index<5;index++)
	{
		if(a[i]==find)
		{
			loc=i;
		}		
	}
	if(loc>=0)
	{
		printf("Element found at location : %d.\n");
	}
	else
	{
		printf("Element not present in array.\n" );
	}
}	