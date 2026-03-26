import java.util.Scanner;

public class octalToHex_18 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int octal;
        System.out.print("Enter octal number: ");
        octal = sc.nextInt();

        int decimal = 0;
        int power = 0;

        // Step 1: Octal → Decimal
        while (octal > 0) {
            int digit = octal % 10;
            decimal = decimal + digit * (int) Math.pow(8, power);
            octal = octal / 10;
            power++;
        }

        // Step 2: Decimal → Hexadecimal
        String hex = "";

        while (decimal > 0) {
            int rem = decimal % 16;

            if (rem < 10) {
                hex = rem + hex;
            } else {
                hex = (char) (rem - 10 + 'A') + hex;
            }

            decimal = decimal / 16;
        }

        System.out.println("Hexadecimal = " + hex);
    }
}