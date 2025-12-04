#include<stdio.h>

int DigitReverse(int n){
    int rem=0;
    rem=n%10;
    n=n/10;
    printf("%d",rem);
    if(n>0) DigitReverse(n);
}

int main(){
    int n, fact;
    scanf("%d", &n);
    DigitReverse(n); 
}