import java.util.Scanner;

// WAP to find weather given number is Ugly or not.
// An ugly number is a positive integer which does not have a prime factor other than 2, 3, and 5.
// Input: n = 6 Output: true Explanation: 6 = 2 × 3

public class Program2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("n = ");
        int n = sc.nextInt();

        int flag=0;
        for(int i=2;i<=n;i++){
        int count=0;

            if(n%i==0 && i!=2){
                continue;
            }
            else if(n%i==0 && i!=3){
                continue;
            }
            else if(n%i==0 && i!=5){
                continue;
            }
            else if(n%i==0){
                for(int j=1;j<=i;j++){
                    if(i%j==0){
                        count++;
                    }
                }
                if(count==2){
                    flag=1;
                }
            }
        }
        if(flag==1) System.out.println("Number is Not a Ugly Number.");
        else System.out.println("Number is Ugly Number.");
    }
}
