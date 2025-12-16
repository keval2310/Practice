#include<stdio.h>

int WithoutPowerOperater(int x, int y){
    if(y==0) return 1;
    y-1;
    if(y>0) return x * WithoutPowerOperater(x,y);
}

int main(){
    int x, y, ans;
    scanf("%d", &x);
    scanf("%d", &y);
    ans = WithoutPowerOperater(x,y);
    printf("%d^%d = %d",x,y,ans);
}