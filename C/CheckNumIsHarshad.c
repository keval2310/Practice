#include<stdio.h>

int main(){
    int n, rem, sum=0, rn;
    scanf("%d", &n);
    rn = n;
    while(n>0){
        rem = n%10;
        sum = sum + rem;
        n = n/10;
    }
    if(rn%sum==0) printf("Harshad Number");
    else printf("Not Harshad Number");
}