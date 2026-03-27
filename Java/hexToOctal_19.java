import java.util.Scanner;

public class hexToOctal_19 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String hex;
        System.out.print("Enter hexadecimal number: ");
        hex = sc.next();

        int decimal = 0;
        int power = 0;

        // Step 1: Hex → Decimal
        for (int i = hex.length() - 1; i >= 0; i--) {
            char ch = hex.charAt(i);
            int value;

            if (ch >= '0' && ch <= '9') {
                value = ch - '0';
            } else {
                value = ch - 'A' + 10;
            }

            decimal = decimal + value * (int) Math.pow(16, power);
            power++;
        }

        // Step 2: Decimal → Octal
        String octal = "";

        while (decimal > 0) {
            int rem = decimal % 8;
            octal = rem + octal;
            decimal = decimal / 8;
        }

        System.out.println("Octal = " + octal);
    }
}