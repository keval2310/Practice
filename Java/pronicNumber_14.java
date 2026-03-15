import java.util.Scanner;

public class pronicNumber_14 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n;
        System.out.print("Enter number: ");
        n = sc.nextInt();

        boolean found = false;

        for (int k = 0; k <= n; k++) {
            if (k * (k + 1) == n) {
                found = true;
                break;
            }
        }

        if (found) {
            System.out.println(n + " is Pronic Number");
        } else {
            System.out.println(n + " is Not Pronic Number");
        }
    }
}