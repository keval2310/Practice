import java.util.Scanner;

public class chocolateWrapper_15 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n, m, k;

        System.out.print("Enter total money (n): ");
        n = sc.nextInt();

        System.out.print("Enter price of one chocolate (m): ");
        m = sc.nextInt();

        System.out.print("Enter wrappers needed for exchange (k): ");
        k = sc.nextInt();

        int chocolates = n / m;
        int wrappers = chocolates;

        while (wrappers >= k) {
            int extra = wrappers / k;
            chocolates = chocolates + extra;
            wrappers = wrappers % k + extra;
        }

        System.out.println("Total chocolates you can eat = " + chocolates);
    }
}