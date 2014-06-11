// Concatenation, modified from : http://www.engineersgarage.com/c-language-programs/check-if-sub-string-present-given-string

#include<stdio.h>

int main()
{
	char str1[100],str2[100],str3[200];	
	int count1=0,count2=0,i;
	
	printf("Enter a string:");
	scanf("%s",str1);

	printf("Enter search substring:");
	scanf("%s",str2);

	for(i=0;i<200;i++)
	{
		str3[i]='\0';
	}

	while (str1[count1]!='\0')
		count1++;

	while (str2[count2]!='\0')
		count2++;

	for(i=0;i<count1;i++)
	{
		str3[i]=str1[i];
	}
	for(i=0;i<count2;i++)
	{
		str3[count1+i]=str2[i];
	}

	printf("Concatenated String : %s\n",str3 );

	return 0;
}
