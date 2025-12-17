#include<stdio.h>

int main(){
    int x, y;
    scanf("%d", &x);
    scanf("%d", &y);
    for(int i=x; i<=y; i++){
        if(i%2==0){
            printf("%d, ",i);
        }
    }
}