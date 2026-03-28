import java.util.Scanner;

public class decimalToOctal_20 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        String octal = "";

        while (n > 0) {
            int rem = n % 8;
            octal = rem + octal;
            n = n / 8;
        }

        System.out.println("Octal = " + octal);
    }
}