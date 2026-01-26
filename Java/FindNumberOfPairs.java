import java.util.*;

// Given an array of N integers, and an integer K,
// find the number of pairs of elements in the array whose
// sum is equal to K.
// Input: N = 4, K = 6, arr[] = {1, 5, 7, 1} Output: 2

public class Program36 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("n = ");
        int n = sc.nextInt();
        int a[] = new int[n];

        for(int i=0; i<n; i++){
            System.out.print("a["+(i+1)+"] = ");
            a[i] = sc.nextInt();
        }
        System.out.print("k = ");
        int k = sc.nextInt();

        int c=0;
        for(int i=0; i<n; i++){
            for(int j=i; j<n; j++){
                int sum = a[i]+a[j];
                if(k==sum && i!=j){
                    c++;
                }
            }
        }

        System.out.print("Output: "+c);
    }
}
