import java.util.Scanner;

public class nthDigit_23 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        int digitLength = 1;
        long count = 9;
        long start = 1;

        // Step 1: Find range
        while (n > digitLength * count) {
            n = (int) (n - digitLength * count);
            digitLength++;
            count *= 10;
            start *= 10;
        }

        // Step 2: Find actual number
        start = start + (n - 1) / digitLength;

        // Step 3: Find digit
        String num = Long.toString(start);
        int result = num.charAt((n - 1) % digitLength) - '0';

        System.out.println(result);
    }
}