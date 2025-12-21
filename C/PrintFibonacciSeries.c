#include<stdio.h>

int main(){
    int n, x1=0, x2=1, x3;
    scanf("%d", &n);
    printf("0, 1, ");
    for(int i=2; i<=n; i++){
        x3 = x1+x2;
        printf("%d, ",x3);
        x1 = x2;
        x2 = x3;
    }
}