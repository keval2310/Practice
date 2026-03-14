import java.util.Scanner;

public class automorphicNumber_13 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n;
        System.out.print("Enter number: ");
        n = sc.nextInt();

        int square = n * n;

        int temp = n;

        while (temp > 0) {
            if (temp % 10 != square % 10) {
                System.out.println(n + " is Not Automorphic Number");
                return;
            }

            temp = temp / 10;
            square = square / 10;
        }

        System.out.println(n + " is Automorphic Number");
    }
}