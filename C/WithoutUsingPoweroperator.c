#include<stdio.h>

int main(){
    int x, y, ans=1;
    scanf("%d", &x);
    scanf("%d", &y);
    for(int i=1; i<=y; i++){
        ans = ans*x;
    }
    printf("%d^%d = %d",x,y,ans);
}