import java.util.Scanner;

public class CheckNumber{

    public static void UglyNumber(int n){
        int flag=0;
        for(int i=2;i<=n;i++){
        int count=0;

            if(n%i==0 && i!=2){
                continue;
            }
            else if(n%i==0 && i!=3){
                continue;
            }
            else if(n%i==0 && i!=5){
                continue;
            }
            else if(n%i==0){
                for(int j=1;j<=i;j++){
                    if(i%j==0){
                        count++;
                    }
                }
                if(count==2){
                    flag=1;
                }
            }
        }
        if(flag==1) System.out.println("Number is Not a Ugly Number.");
        else System.out.println("Number is Ugly Number.");
    }

    public static void KaprekarNumber(int n){
       int sq= n*n;
       int temp=n;
       int digit=0;

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
    
    public static void AutomorphicNumber(int n){
        int sq= n*n;
        int temp=n;
        int digit=0;

        while(temp!=0){
            temp=temp/10;
            digit++;
        }

        int divide=1;
        for(int i=0;i<digit;i++){
            divide=divide*10;
        }

        int temp2;
        temp2=sq%divide;

        if(n==temp2) System.out.println("Automorphic Number");
        else System.out.println("Not Automorphic Number");
    }

    public static void PronicNumber (int n){
        int flag=0;
        int a,b;
        for(int i=1;i<=n;i++){
            int temp;
            a=i;
            b=i+1;
            temp= a * b ;
            if(temp==n){
                flag=1;
            }
        }

        if(flag==1) System.out.println("Pronic Number");
        else System.out.println("Not Pronic Number");

    }

    public static void HappyNumber(int n){
        int temp=n;
        int sum=0;
        while(temp!=1 && sum!=4){
            sum=0;
            while(temp!=0){
                int digit = temp % 10;
                sum = sum + (digit * digit);
                temp = temp / 10;
            }
            temp=sum;
        }

        if(temp==1) System.out.println("Happy Number");
        else System.out.println("Not Happy Number");
    }

    public static void HappyNumber2(int n){
        int a[] = new int[100];
        int temp = n;
        int sum = 0, digit;
        int i=0;
        while(temp!=1){
            sum = 0;
            while(temp!=0){
                digit = temp % 10;
                sum = sum + (digit * digit);
                temp = temp / 10;
                a[i] = sum;
                i++;
                for(int j=0; j>100; i++){
                    if(a[j]==sum){
                        temp = sum;
                        temp = 0;
                        break;
                    }
                }
            }
            temp = sum;
        }

        if(temp==1) System.out.println("Happy Number");
        else System.out.println("Not Happy Number");
    }


    public static void main (String [] args){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        
        //UglyNumber(n);
        //KaprekarNumber(n);
        //AutomorphicNumber(n);
        //PronicNumber(n);
        //HappyNumber(n);
        HappyNumber2(n);
    }
}