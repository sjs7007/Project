#include<stdio.h>
void main()
{
	int i,j,k=0;
	for(i=0;i<3;i++)
	{
		for(j=0;j<=3;j++)
		{
			k=k+3;
			printf("%d %d",i,j);
		}
	}
}
