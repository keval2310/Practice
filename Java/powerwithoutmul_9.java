import java.util.Scanner;

public class powerwithoutmul_9 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int a, b;
        int result = 1;

        System.out.print("Enter base (a): ");
        a = sc.nextInt();

        System.out.print("Enter power (b): ");
        b = sc.nextInt();

        for (int i = 1; i <= b; i++) {
            int temp = 0;

            for (int j = 1; j <= a; j++) {
                temp = temp + result;
            }

            result = temp;
        }

        System.out.println("Answer = " + result);
    }
}