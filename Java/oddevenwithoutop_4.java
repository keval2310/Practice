import java.util.Scanner;

public class oddevenwithoutop_4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("enter an number :");
        int n = sc.nextInt();

        if ((n / 2) * 2 == 0) {
            System.out.println("even");
        } else {
            System.out.println("odd");
        }
    }
}