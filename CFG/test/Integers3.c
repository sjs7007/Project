//Integer level 3 : Level 2 + while 

#include<stdio.h>
void main()
{
	/*int i,j,k=0;
	for(i=0;i<3;i++)
	{
		for(j=0;j<=3;j++)
		{
			k = 5;
			k = 7*k + 55 *43 -34 +23 + 3*4 + 32;
			printf("%d %d",i,j);
		}
	}*/

	//Level 3
	
	int x=1;
	
	while(x<=5)
	{
		printf("%d /n",x);
		x++;
	}
	
	printf("New line here. /n");
	printf("No new line.");

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
}
