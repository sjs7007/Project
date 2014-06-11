/* http://www.c4learn.com/c-programs/program-to-implement-insertion-sort-in-c-programming.html */

#include<stdio.h>
int main(){

  int i,j,num,temp,a[20];

  printf("Enter total elements: ");
  scanf("%d",&num);

  printf("Enter %d elements: ",num);
  for(i=0;i<num;i++)
      scanf("%d",&a[i]);

  for(i=1;i<num;i++){
      temp=a[i];
      j=i-1;
      while((temp<a[j])&&(j>=0)){
      a[j+1]=a[j];
          j=j-1;
      }
      a[j+1]=temp;
  }

  printf("After Sorting: ");
  for(i=0;i<num;i++)
      printf("%d",a[i]);

  return 0;
}
