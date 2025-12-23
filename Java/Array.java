import java.util.Scanner;

public class Array {

    public static int[] RotateArray(int a[], int k){
        int r = k-1;
        int n = a.length;
        int b[] = new int [n];

        for(int i=0; i<r; i++){
            for(int j=r; j<n; j++){
                b[i] = a[j];
            }
        }

        return a;
    }

    public static int[] ReverseArray(int a[]){
        int n = a.length;
        int n2 = n/2;
        int k = n-1;
        
        for(int i=0; i<n2; i++){
            int temp = a[i];
            a[i] = a[k];
            a[k] = temp;
            k--;
        }

        return a;
    }

    public static void FindIndexAndMinMax(int a[], int search){
        int n = a.length;
        int max = a[0];
        int min = a[0];
        for(int i=1;i<n;i++){
            if(a[i]>max){
                max = a[i];
            }
            if(a[i]<min){
                min = a[i];
            }
            if(a[i]==search){
                System.out.println("Index of "+search+" : "+i);
            }
        }
        System.out.println("Min = "+min+"\nMax = "+max);
    }
    
    public static void DisplayArray(int a[]){
        for(int i=0; i<a.length; i++){
            System.out.print(a[i]+" ");
        }
        System.out.println();
    }

    //Find the difference between the second largest element and the second smallest element of an array.
    public static void SecondLargestAndSmallest(int a[]){
        int n = a.length;
        int min = a[0];
        int max = a[0];
        int tempMin = Integer.MAX_VALUE;
        int tempMax = 0;

        for(int i=0; i<n; i++){
            if(a[i] < min){
                min = a[i];
            }
            if(a[i] > max){
                tempMax = max;
                max = a[i];
            }
        }
        for (int i = 0; i < n; i++) {
            if (a[i] > min && a[i] < tempMin) {
                tempMin = a[i];
            }
        }
        System.out.print("difference = "+(tempMax-tempMin));
    }

    public static  int k=0;
    public static boolean ElementIsInArray(int a[],int m){
        if(k>=a.length){
            return false;
        }
        if(a[k]==m){
            return true;
        }
        k++;
        return ElementIsInArray(a,m);
    }

    // Given an array of positive integers arr[] of size n, the task is to find the second largest distinct element in
    // the array.
    // Note: If the second largest element does not exist, return -1
    public static int IsSecondElementExist(int a[]){
        int n = a.length;
        int max = a[0];
        int secondmax = 0;

        for(int i=0; i<n; i++){
            if(a[i] >= max){
                secondmax = max;
                max = a[i];
            }
        }

        if(secondmax == max) return -1;
        else return secondmax;
    }

    // Given an array nums with n integers, your task is to check if it could become non-decreasing by modifying
    // at most one element.
    // Input: nums = [4,2,3]
    // Output: true
    public static boolean chackArray(int a[]){
        int n = a.length;
        int c = 0;

        for(int i=0; i<n; i++){
            if(a[i]<=a[i+1]){
                c++;
            }
            else{
                a[i] = a[i+1] - 1;
                if(a[i]<=a[i+1]){
                    c++;
                    break;
                }
            }
        }
        if(c==n-1){
            return true;
        }
        return false;
    }

    public static void main (String [] args){
        Scanner sc = new Scanner(System.in);
        System.out.print("n = ");
        int n = sc.nextInt();

        int[] a = new int[n];
        for(int i=0;i<n;i++){
            System.out.print("a["+(i+1)+"] = ");
            a[i] = sc.nextInt();
        }
        System.out.print("Array : ");
        DisplayArray(a);

        // System.out.print("Find index of ");
        // int search = sc.nextInt();
        // FindIndexAndMinMax(a, search);
        
        //ReverseArray(a);
        // System.out.print("Reverse : ");
        // DisplayArray(a);
        
        // System.out.print("Rotation = ");
        // int k = sc.nextInt();
        // RotateArray(a, k);
        // System.out.print("Rotated : ");
        // DisplayArray(a);

        //SecondLargestAndSmallest(a);

        // System.out.print("Element = ");
        // int m = sc.nextInt();
        // boolean ans = ElementIsInArray(a, m);
        // System.out.print("Answer = "+ans);

        // int ans2 = IsSecondElementExist(a);
        // System.out.print("Answer = "+ans2);

        boolean ans3 = chackArray(a);
        System.out.println("Output : "+ans3);
    }
}
