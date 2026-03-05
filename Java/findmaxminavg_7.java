import java.util.Scanner;

public class findmaxminavg_7 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt();

        if (n <= 0) {
            System.out.println("Invalid Input");
            return;
        }

        int num = sc.nextInt();

        int max = num;
        int min = num;
        int sum = num;

        for (int i = 2; i <= n; i++) {

            num = sc.nextInt();

            if (num > max) {
                max = num;
            }

            if (num < min) {
                min = num;
            }

            sum = sum + num;
        }

        double average = (double) sum / n;

        System.out.println("Max = " + max);
        System.out.println("Min = " + min);
        System.out.println("Average = " + average);
    }
}