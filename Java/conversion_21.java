import java.util.Scanner;

public class conversion_21 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int choice;
        System.out.println("1. Decimal to Hex");
        System.out.println("2. Hex to Decimal");
        choice = sc.nextInt();

        if (choice == 1) {
            int n = sc.nextInt();
            String hex = "";

            while (n > 0) {
                int rem = n % 16;

                if (rem < 10) {
                    hex = rem + hex;
                } else {
                    hex = (char) (rem - 10 + 'A') + hex;
                }

                n = n / 16;
            }

            System.out.println(hex);
        } else if (choice == 2) {
            String hex = sc.next();

            int decimal = 0;
            int base = 1;

            for (int i = hex.length() - 1; i >= 0; i--) {
                char ch = hex.charAt(i);
                int value;

                if (ch >= '0' && ch <= '9') {
                    value = ch - '0';
                } else {
                    value = ch - 'A' + 10;
                }

                decimal = decimal + value * base;
                base = base * 16;
            }

            System.out.println(decimal);
        }
    }
}