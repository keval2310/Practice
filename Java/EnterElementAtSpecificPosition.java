import java.util.*;

public class EnterElementAtSpecificPosition{

    public static void main(String [] args){
        Scanner sc = new Scanner(System.in);

        System.out.print("size : ");
        int size = sc.nextInt();

        int a[] = new int [size+1];

        for(int i=0; i<size; i++){
            System.out.print("a["+i+"] : ");
            a[i] = sc.nextInt();
        }
        System.out.print("Array : ");
        for(int i=0; i<size; i++){
            System.out.print(a[i]+" ");
        }

        System.out.print("\nposition : ");
        int p = sc.nextInt();
        System.out.print("Element : ");
        int e = sc.nextInt();

        int temp = a[p];
        a[p] = e;

        for(int i=p; i<size; i++){ 
            int temp2 = a[i+1];
            a[i+1] = temp;
            temp = temp2;
        }

        System.out.print("New : ");
        for(int i=0; i<=size; i++){
            System.out.print(a[i]+" ");
        }
    }
}