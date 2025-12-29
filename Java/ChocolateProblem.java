import java.util.Scanner;

public class ChocolateProblem {
    public static void main(String[] var0) {
        Scanner sc = new Scanner(System.in);

        System.out.print("rupees = ");
        int n = sc.nextInt();
        System.out.print("Chocolate = ");
        int m = sc.nextInt();
        System.out.print("wrapper = ");
        int k = sc.nextInt();
        
        int remChocolate;
        int temp;
        int NoOfchocolate = n/m;

        int currentChocolate=NoOfchocolate;

        while(currentChocolate >= k){
             temp = currentChocolate / k ; 
             remChocolate = currentChocolate % k;
             remChocolate = remChocolate + temp;
             currentChocolate = remChocolate;   
             NoOfchocolate = NoOfchocolate + temp;
        }

        System.out.println(NoOfchocolate);
    }
}
