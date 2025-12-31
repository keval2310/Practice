import java.util.Scanner;

public class Sorting {

    public static int [] SelectionSort(int a[]){
        int minj, minx;

        for(int i=0; i<a.length; i++){
            minj = i;
            minx = a[i];

            for(int j=i+1; j<a.length; j++){
                
                if(a[j] < minx){
                    minj = j;
                    minx = a[j];
                }
            }
            a[minj] = a[i];
            a[i] = minx;
        }
        return a;
    }

    public static int [] InsertionSort(int a[]){
        int j, x;

        for(int i=2; i<a.length; i++){
            x = a[i];
            j = i-1;

            while (a[j]>x && j>0) {
                a[j+1] = a[j];
                j--;
            }
            a[j+1] = x;
        }
        return a;
    }

    public static void DisplayArray(int a[]){
        for(int i=0; i<a.length; i++){
            System.out.print(a[i]+" ");
        }
    }
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Size : ");
        int size = sc.nextInt();
        int a[] = new int[size];

        for(int i=0; i<size; i++){
            System.out.print("a["+(i+1)+"] : ");
            a[i] = sc.nextInt();
        }
        System.out.print("Array : ");
        DisplayArray(a);

        SelectionSort(a);
        System.out.print("\nSorted Array : ");
        DisplayArray(a);

        InsertionSort(a);
        System.out.print("\nSorted Array : ");
        DisplayArray(a);
        
    }
}
