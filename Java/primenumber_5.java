import java.util.Scanner;

public class primenumber_5 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("start range :");
        int start = sc.nextInt();

        System.out.print("end range :");
        int end = sc.nextInt();

        for (int i = start; i <= end; i++) {
            if (i <= 1) {
                continue;
            }

            boolean isPrime = true;

            for (int j = 2; j < i; j++) {
                if (i % j == 0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime == true) {
                System.out.println(i + " ");
            }
        }
    }
}