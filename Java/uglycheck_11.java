import java.util.Scanner;

public class uglycheck_11 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n;

        System.out.print("Enter number: ");
        n = sc.nextInt();

        int num = n;

        while (num % 2 == 0) {
            num = num / 2;
        }

        while (num % 3 == 0) {
            num = num / 3;
        }

        while (num % 5 == 0) {
            num = num / 5;
        }

        if (num == 1) {
            System.out.println(n + " is Ugly Number");
        } else {
            System.out.println(n + " is Not Ugly Number");
        }
    }
}