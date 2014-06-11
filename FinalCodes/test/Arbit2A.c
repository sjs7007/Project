// Search for element in an array

#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int i,j,find=7,loc=-1;
	for(i=0;i<5;i++)
	{
		if(a[i]==find)
		{
			loc=i;
		}		
	}
	if(loc>=0)
	{
		printf("Element found at location : %d.\n",loc);
	}
	else
	{
		printf("Element not present in array.\n" );
	}
	return 0;
}	

