#include<stdio.h>

int main(){
    int x, y, LCM;
    scanf("%d", &x);
    scanf("%d", &y);
    int max = (x>y) ? x : y ;
    for(int i=max; i<=x*y; i++){
        if(i%x==0 && i%y==0){
            LCM = i;
            break;
        }
    }
    printf("LCM = %d", LCM);
}