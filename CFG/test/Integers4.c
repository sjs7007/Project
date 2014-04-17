//Integer level 4 : All leves combined + do while

#include<stdio.h>
void main()
{
	int p,q,r;

	//for loop testing + internal identifiers
	int i,j;
	for(i=0;i<4;i++)
	{
		for(j=0;j<5;j++)
		{
			p=4*50+45+56+2*i;
			q=p+10;
			r=3*q;
		}
	}
	

	//while loop testing
	int x=1;
	while(x<=5)
	{
		x++;
		printf("%d",x);
	}

	//switch case testing
	switch(x)
	{
		case 1:	
			printf("New line here case 1.\n");
			break;

		case 2:
			printf("No new line case 2");
			break;

		case 3:
			printf("New line here case 3.\n");
			printf("3.2");
			printf("3.3");
			printf("3.4");
			int p = 45;
			int q = 56;
			int r  = p +1;
			break;

		default:
			printf("Make more cases \n");
	}

	//do while loop testing
	x=1;
	do
	{
		printf("%d",x);
		x++;
	}
	while(x<=5);

	//if condition testing
	if(x>=5)
	{
		printf("yes");
	}
}
