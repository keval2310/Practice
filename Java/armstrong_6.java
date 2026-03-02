import java.util.Scanner;

public class armstrong_6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("enter an number :");
        int num = sc.nextInt();
        int original = num;

        int count = 0;
        int temp = num;

        while (temp > 0) {
            temp = temp / 10;
            count++;
        }
        int sum = 0;
        temp = num;

        while (temp > 0) {
            int digit = temp % 10;
            int power = 1;
            for (int i = 1; i <= count; i++) {
                power = power * digit;
            }
            sum = sum + power;
            temp = temp / 10;
        }
        if (sum == original) {
            System.out.println("armstrong number");
        } else {
            System.out.println("not armstrong number");
        }
    }
}
