import java.util.*;

// Write a Function that returns either 1 or 0 based on following condition if the array is in ascending order
// and occurrence of that number at least 3 then it should return 1 otherwise it should return 0.
// e.g. if A=[1,1,1,2,2] it should return 0, if A= [1,1,1,3,3,3,3] it should return 1.

public class Program38 {

    public static boolean checkArray(int a[]) {
        int n = a.length;
        int d = a[0];
        int c = 1;
        for(int i=1; i<n; i++){
            if(d == a[i]){
                c++;
            }
            else{
                if(c>=3 && d<a[i]){
                    d = a[i];
                    c = 1;
                }
                else{
                    return false;
                }
            }
        }
        if(c<3){
            return false;
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

        boolean ans = checkArray(a);
        System.out.print("Output : "+ans);
    }
}
