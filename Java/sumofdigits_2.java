import java.util.Scanner;

public class sumofdigits_2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("enter an digits :");
        int n = sc.nextInt();

        int sum = 0;

        while(n>0){
            int digit = n%10; // find last digit
            sum = sum + digit; // add to sum
            n = n/10; // remove last digit
        }

        System.out.println("ans is :" + sum);
    }
}