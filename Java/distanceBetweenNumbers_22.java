import java.util.Scanner;

public class distanceBetweenNumbers_22 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int a, b;
        System.out.print("Enter first number: ");
        a = sc.nextInt();

        System.out.print("Enter second number: ");
        b = sc.nextInt();

        int xor = a ^ b;
        int count = 0;

        while (xor > 0) {
            if ((xor & 1) == 1) {
                count++;
            }

            xor = xor >> 1;
        }

        System.out.println("Distance = " + count);
    }
}