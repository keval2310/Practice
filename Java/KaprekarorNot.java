import java.util.*;

// WAP to find weather given number is Kaprekar or not.
// A Kaprekar number is a non-negative integer that, when squared, can be split into two parts whose sum
// equals the original number.
// For E.g. 45 is a Kaprekar number because 45 squared (2025) can be split into 20 and 25, and 20 + 25 = 45

public class Program3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("n = ");
        int n = sc.nextInt();

        int sq = n*n;
        int temp = n;
        int digit= 0;

        while(temp!=0){
            temp=temp/10;
            digit++;
        }
        int divide=1;
        for(int i=0; i<digit; i++){
            divide=divide*10;
        }

        int temp2,temp3;
        temp2 = sq%divide;
        temp3 = sq/divide;

        int sum = temp2 + temp3;
        if(n == sum) System.out.println("Kaprekar Number");
        else System.out.println("Not Kaprekar Number");
    }
}
