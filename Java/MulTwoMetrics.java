import java.util.*;

// WAP to multiply two matrices with error checking for dimension compatibility.

public class Program37 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Matrix - 1 :\nn = ");
        int n1 = sc.nextInt();
        System.out.print("m = ");
        int m1 = sc.nextInt();

        System.out.print("Matrix - 2 :\nn = ");
        int n2 = sc.nextInt();
        System.out.print("m = ");
        int m2 = sc.nextInt();

        if(m1!=n2) {
            System.out.print("multiply is not possible");
            return;
        } 

        int matrix1[][] = new int[n1][m1];
        int matrix2[][] = new int[n2][m2];
        int matrix3[][] = new int[n1][m2];

        System.out.println("Matrix - 1 : ");
        ScanMatrix(matrix1, n1, m1);
        
        System.out.println("-------------");
        System.out.println("Matrix - 2 : ");
        ScanMatrix(matrix2, n2, m2);
        
        System.out.println("-------------");
        System.out.println("Matrix - 1 : ");
        DisplayMatrix(matrix1, n1, m1);
        
        System.out.println("-------------");
        System.out.println("Matrix - 2 : ");
        DisplayMatrix(matrix2, n2, m2);

        if(m1==n2){
            for(int i=0; i<n1; i++){
                for(int j=0; j<m2; j++){
                    for(int k=0; k<m1; k++){
                        matrix3[i][j] += matrix1[i][k] * matrix2[k][j]; 
                    }
                }
            }
            System.out.println("-------------");
            DisplayMatrix(matrix3, n1, m2);
            System.out.println("-------------");
        }
        else{
            System.out.print("multiply is not possible");
        }
    }

    public static int [][] ScanMatrix(int matrix[][], int n, int m){
        Scanner sc = new Scanner(System.in);
        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                System.out.print("M["+(i+1)+"]["+(j+1)+"] = ");
                matrix[i][j]= sc.nextInt();
            }
        }
        return matrix;
    }

    public static void DisplayMatrix(int matrix[][], int n, int m){
        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                System.out.print(matrix[i][j]+"\t");
            }
            System.out.println();
        }
    }
}
