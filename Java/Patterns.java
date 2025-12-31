import java.util.*;

public class Patterns{

// 1 
// 1 2
// 1 2 3
// 1 2 3 4
// 1 2 3 4 5
    public static void pattern1(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=i; j++){
                System.out.print(j+" ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

//     *
//   * * *
// * * * * *
    public static void pattern2(){
        int n=3,k=1;
        for(int i=1; i<=n; i++){
            for(int j=n-i; j>=1; j--){
                System.out.print("  ");
            }

            for(int j=1; j<=k; j++){
                System.out.print("* ");
            }
            k=k+2;
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1
// 2 3
// 4 5 6
// 7 8 9 10
// 11 12 13 14 15
    public static void pattern3(){
        int n=5,k=1;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=i; j++){
                System.out.print(k+" ");
                k++;
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// *
// * *
// * * *
// * * * *
// * * * * *
    public static void pattern4(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=i; j++){
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

//         *
//       * *
//     * * *
//   * * * *
// * * * * *
    public static void pattern5(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=5-i; j>=1; j--){
                System.out.print("  ");
            }
            for(int j=1; j<=i; j++){
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// * * * * *
// * * * *
// * * *
// * *
// *
    public static void pattern6(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=n-i+1; j>=1; j--){
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// * * * * *
//   * * * *
//     * * *
//       * *
//         *
    public static void pattern7(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=i-1; j>=1; j--){
                System.out.print("  ");
            }
            for(int j=1; j<=n-i+1; j++){
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// * * * * * * * * *
//   * * * * * * *
//     * * * * *
//       * * *
//         *
    public static void pattern8(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=i-1; j>=1; j--){
                System.out.print("  ");
            }
            for(int j=i; j<=n*2-i; j++){
                System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1 2 3 4 5
// 1 2 3 4
// 1 2 3
// 1 2
// 1
    public static void pattern9(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=n-i+1; j++){
                System.out.print(j+" ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 5 4 3 2 1
// 4 3 2 1
// 3 2 1
// 2 1
// 1
    public static void pattern10(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=n-i+1; j>=1; j--){
                System.out.print(j+" ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1 
// 2 1
// 3 2 1
// 4 3 2 1
// 5 4 3 2 1
    public static void pattern11(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=i; j>=1; j--){
                System.out.print(j+" ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 5 6 7 8 9
// 4 5 6 7
// 3 4 5
// 2 3
// 1
    public static void pattern12(){
        int n=5,k;
        for(int i=1; i<=n; i++){
            k = n-i+1;
            for(int j=1; j<=n-i+1; j++){
                System.out.print(k+" ");
                k++;
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// *       *
// * *   * *
// *   *   *
// * *   * *
// *       *
    public static void pattern13(){
        int n=5;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=n; j++){
                if(j==1 || j==n || j==i || j==n-i+1){
                    System.out.print("* ");
                }
                else{
                    System.out.print("  ");
                }

            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1
// 2 5
// 3 6 8
// 4 7 9 10
    public static void pattern_11(){
        int n=4, k;
        for(int i=1; i<=n; i++){
            int d=n-1;
            k = i;
            for(int j=1; j<=i; j++){
                System.out.print(k+" ");
                k=k+d;
                d--;
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1
// 1 * 1
// 1 * 3 * 1
// 1 * 3 * 3 * 1
// 1 * 3 * 5 * 3 * 1
    public static void pattern_12(){
        int n=5;

        for(int i=1; i<=n; i++){
            int k=1;
            for(int j=1; j<=i*2-1; j++){
                if(j%2!=0){
                    if(j<((i*2-1)/2)+1){
                        System.out.print(k+" ");
                        k=k+2; 
                    }
                    else if(j>((i*2-1)/2)+1){ 
                        k=k-2; 
                        System.out.print(k+" ");
                    }
                    else if(j==((i*2-1)/2)+1){ 
                        int e=k; 
                        System.out.print(e+" ");
                    }

                }
                else System.out.print("* ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// * * * * * * *
//   *       *
//     *   *
//       *
//     *   *
//   *       *
// * * * * * * *
    public static void pattern_13(){
        int n=7;
        for(int i=1; i<=n; i++){
            int x=n, y=n;
            if(i==1 || i==n){
                for(int k=1; k<=n; k++){
                   System.out.print("* ");
                }
            }
            for(int j=1; j<=n; j++){
                if(i==j && i!=n && i!=1 || i!=(n/2)+1 && j==n-i+1 && i!=n && i!=1){
                    System.out.print("* ");
                }
                else{
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

//    1
//   212
//  32123
// 4321234
//  32123
//   212
//    1
    public static void pattern_14(){
        int n=7;
        int m = (n+1)/2; // 4
        for(int i=1; i<=n; i++){
            if(i<=m){
                int k1=((i*2-1)/2)+1 ,k2=1 ;
                for(int j=m-i; j>=1; j--){
                    System.out.print(" ");
                }
                for(int j=1; j<=i*2-1; j++){
                    if(j<=(i*2-1)/2) System.out.print(k1--);
                    else if(j>(i*2-1)/2) System.out.print(k2++);
                    else System.out.print(m*2-j+1);
                } 
            }
            else if(i>m){
                int k3=m*2-i ,k4=1 ;
                for(int j=i-m; j>=1; j--){
                    System.out.print(" ");
                }
                for(int j=1; j<=(m*2-i)*2-1; j++){
                    if(j<=((m*2-i)*2-1)/2) System.out.print(k3--);
                    else if(j>((m*2-i)*2-1)/2) System.out.print(k4++);
                    else System.out.print(m*2-j+1);
                } 
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1
// 1 2 1
// 1 * 3 * 1
// 1 * * 4 * * 1
// 1 * * * 5 * * * 1
// 1 * * * * 6 * * * *1
    public static void pattern_15(){
        int n=7;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=i*2-1; j++){
                if(j==1 || j==i*2-1){
                    System.out.print("1");
                }
                else if(j==i){
                    System.out.print(i);
                }
                else{
                    System.out.print("*");
                }
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// *       * * * * *
// *       *
// *   *   *   *
// *       *         
// * * * * * * * * *
//         *       *
//     *   *   *   *
//         *       * 
// * * * * *       *
    public static void pattern_16(){
        int n=9;
        int m=(n+1)/2;
        for(int i=1; i<=n; i++){
            for(int j=1; j<=n; j++){
                if(i==m || j==m || j==1 && i<m || j==n && i>m || j>m && i==1 || j<m && i==n){
                    System.out.print("* ");
                }
                else if(i==(m/2)+1 && j==(m/2)+1 || i==(m/2)+1 && j==m+(m/2) || i==m+(m/2) && j==(m/2)+1 || i==m+(m/2) && j==m+(m/2)){
                    System.out.print("* ");
                }
                else{
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

//     1
//    1 1
//   1 2 1
//  1 3 3 1
// 1 4 6 4 1
    public static void pattern_17(){
        int n=5;
        int [][]array = new int[n][2*n-1];

        for(int i=0; i<n;  i++){
            array[i][0]=1;
            array[i][i]=1;
            for(int j=1; j<i; j++){  
                array[i][j] = array[i-1][j-1] + array[i-1][j];
            }
        }
        for(int  i = 0; i<array.length; i++ ){
            for(int j=n-i-1; j>=1; j--){
                System.out.print(" ");
            }
            for(int j = 0 ; j<array.length; j++){
                if (array[i][j]==0) continue;
                System.out.print(array[i][j]+" ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 1  2  3  4  5
// 10 9  8  7  6
// 11 12 13 14 15
// 20 19 18 17 16
// 21 22 23 24 25
    public static void pattern_19(){
        int n=5,k=0;
        for(int i=1; i<=n; i++){
            if(i%2==0){
                for(int j=n; j>=1; j--){
                    System.out.print(k+"\t");
                    k--;
                }
                k=k+5;
            }
            else{
                for(int j=1; j<=n; j++){
                    k++;
                    System.out.print(k+"\t");
                }
                k=k+5;
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

// 4 4 4 4 4 4 4
// 4 3 3 3 3 3 4
// 4 3 2 2 2 3 4
// 4 3 2 1 2 3 4
// 4 3 2 2 2 3 4
// 4 3 3 3 3 3 4
// 4 4 4 4 4 4 4
    public static void pattern_20(){
        int n=4;
        int size = n*2-1; 
        
        for (int i=0; i<size; i++) {
            for (int j=0; j<size; j++) {
                int top = i;
                int left = j;
                int right = size - 1 - j;
                int bottom = size - 1 - i;

                int min = Math.min( Math.min(top, bottom), Math.min(left, right) );

                System.out.print((n-min)+" ");
            }
            System.out.println();
        }
        System.out.println("_________\n");
    }

    public static void main (String [] args){
        pattern1();
        pattern2();
        pattern3();
        pattern4();
        pattern5();
        pattern6();
        pattern7();
        pattern8();
        pattern9();
        pattern10();
        pattern11();
        pattern12();
        pattern13();
        pattern_11();
        pattern_12();
        pattern_13();
        pattern_14();
        pattern_15();
        pattern_16();
        pattern_17();
        pattern_19();
        pattern_20();
    }
}