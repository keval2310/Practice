import java.util.Scanner;

public class kaprekarnumber_12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n;
        System.out.print("Enter number: ");
        n = sc.nextInt();

        int square = n * n;
        int temp = n;
        int digits = 0;

        // count digits of n
        while (temp > 0) {
            temp = temp / 10;
            digits++;
        }

        int divisor = 1;

        for (int i = 1; i <= digits; i++) {
            divisor = divisor * 10;
        }

        int right = square % divisor;
        int left = square / divisor;

        if (left + right == n) {
            System.out.println(n + " is Kaprekar Number");
        } else {
            System.out.println(n + " is Not Kaprekar Number");
        }
    }
}