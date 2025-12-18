#include<stdio.h>

int main(){
    int x, y, GCD;
    scanf("%d", &x);
    scanf("%d", &y);
    int min = (x<y) ? x : y ;
    for(int i=1; i<=min; i++){
        if(x%i==0 && y%i==0){
            GCD = i;
        }
    }
    printf("GCD = %d", GCD);
}