import java.util.Scanner;

public class oddevencount_3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter an number :");
        int n = sc.nextInt();

        int evencount = 0;
        int oddcount = 0;

        while (n != 0) {

            int digit = n % 10; // last digit extract krva mate
            if (digit % 2 == 0) {
                evencount++;
            } else {
                oddcount++;
            }

            n = n / 10; // remove last digit
        }
        System.out.println("even number :" + evencount);
        System.out.println("odd number :" + oddcount);
    }
}
