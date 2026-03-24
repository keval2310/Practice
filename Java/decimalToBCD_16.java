import java.util.Scanner;

public class decimalToBCD_16 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n;
        System.out.print("Enter number: ");
        n = sc.nextInt();

        int temp = n;

        int[] digits = new int[20];
        int i = 0;

        // Step 1: Extract digits (reverse order)
        while (temp > 0) {
            digits[i] = temp % 10;
            temp = temp / 10;
            i++;
        }

        System.out.print("BCD = ");

        // Step 2: Print in correct order
        for (int j = i - 1; j >= 0; j--) {
            int digit = digits[j];

            // Convert digit to 4-bit binary
            for (int k = 3; k >= 0; k--) {
                int bit = (digit >> k) & 1;
                System.out.print(bit);
            }

            System.out.print(" ");
        }
    }
}