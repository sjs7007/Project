#include<stdio.h>


int main()
{
FILE *fp1,*fp2;
char a;

fp1=fopen("theoryTest1.c","r");
if(fp1==NULL)
    {
    puts("cannot open this file");
	return -1;
    }

fp2=fopen("ProcessedTheoryTest1.c","w");
if(fp2==NULL)
    {
    puts("Not able to open this file");
    fclose(fp1);
    return -1;
    }

   do
    {
    a=fgetc(fp1);
    fputc(a,fp2);
    }while(a!=EOF);

fcloseall();
}
