import java.util.Scanner;

public class WithoutMultiOrPowerOpretor{
    public static void main (String [] args){
        Scanner sc = new Scanner(System.in);
        System.out.print("Base = ");
        int x = sc.nextInt();
        System.out.print("Power= ");
        int y = sc.nextInt();

        int temp = x;

        int ans=x;

        for(int j=1;j<=y-1;j++){
            for(int i=1;i<x;i++){
                ans = ans + temp;//10 
            }
           temp = ans;
        }
        System.out.println(x+"^"+y+" = "+ans);
    }
}