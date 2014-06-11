// Sum of elements in an array

#include<stdio.h>

int main()
{
	int a[]={5,3,1,4,2};
	int i,sum=0;
	for(i=0;i<5;i++)
	{
		sum = sum + a[i];	
	}
	
	printf("Sum of all elements in array : %d.\n",sum );
	return 0;
}	

