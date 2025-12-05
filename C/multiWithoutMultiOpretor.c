#include<stdio.h>

int main(){
    int x, y, sum=0;
    scanf("%d", &x);
    scanf("%d", &y);
    for(int i=0; i<x; i++){
        sum = sum+y;
    }
    printf("%d x %d = %d", x, y, sum);
}