import java.util.*;

// Given an array nums with n integers, your task is to check if it could become non-decreasing by modifying
// at most one element.
// Input: nums = [4,2,3]
// Output: true
// Explanation: You could modify the first 4 to 1 to get a non-decreasing array.

public class Program35 {

    public static boolean checkNonDecreasing(int a[]) {
        int violations = 0;
        int n = a.length-1;
        for (int i = 0; i<n; i++) {
            if (a[i] > a[i+1]) {
                violations++;
                if (violations > 1) {
                    return false;
                }
                if (i > 0 && a[i-1] > a[i+1]) {
                    a[i + 1] = a[i]; 
                } 
                else {
                    a[i] = a[i+1]; 
                }
            }
        }
        return true;
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);


        System.out.print("n = ");
        int n = sc.nextInt();
        int a[] = new int[n];

        for(int i=0; i<n; i++){
            System.out.print("a["+(i+1)+"] = ");
            a[i] = sc.nextInt();
        }

        boolean ans = checkNonDecreasing(a);
        System.out.println("Output : "+ans);
    }
}
