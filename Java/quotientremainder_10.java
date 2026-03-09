import java.util.Scanner;

public class quotientremainder_10 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int num1, num2;
        int bigger, smaller;
        int quotient = 0;

        System.out.print("Enter first number: ");
        num1 = sc.nextInt();

        System.out.print("Enter second number: ");
        num2 = sc.nextInt();

        if (num1 > num2) {
            bigger = num1;
            smaller = num2;
        } else {
            bigger = num2;
            smaller = num1;
        }

        while (bigger >= smaller) {
            bigger = bigger - smaller;
            quotient++;
        }

        int remainder = bigger;

        System.out.println("Quotient = " + quotient);
        System.out.println("Remainder = " + remainder);
    }
}