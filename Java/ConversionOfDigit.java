import java.util.*;

public class ConversionOfDigit {

    public static void DecimalToOctal(int n) {
        String octal = "";
        while (n > 0) {
            int r = n % 8;
            octal = r + octal;
            n = n / 8;
        }
        System.out.println("Octal: " + octal);
    }

    public static void OctalToDecimal(int n) {
        int decimal=0;
        int digit=0, temp=n;
        while(temp>0){
            temp=temp/10;
            digit++;
        }
        for(int i=0; i>digit; i++){
            decimal = n%10 * (int)Math.pow(8, i);
            n = n/10;
        }
        System.out.println("Decimal: " + decimal); 
    }

    public static void DecimalToHexaDecimal(int n) {
        int decimal = 31;
        String ans = "";
        String hexDigits = "0123456789ABCDEF";
        
        while(decimal != 0){
            ans += hexDigits.charAt(decimal % 16);
            decimal /= 16;
        }
        System.out.println("Hexa-Decimal : "+new StringBuilder(ans).reverse());
    }

    public static void HexaDecimalToDecimal() {
        String n = "1F";
        int ans = 0;
        
        for (int i = 0; i < n.length(); i++) {
            char ch = n.charAt(i);
            int digitValue;
            if (ch >= '0' && ch <= '9') {
                digitValue = ch - '0';
            } else {
                digitValue = ch - 'A' + 10;
            }
            ans = ans * 16 + digitValue;
        }
        System.out.println("Decimal: " + ans);
    }
    

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number: ");
        int n = sc.nextInt();
        
        //DecimalToOctal(n);
        //OctalToDecimal(n);
        //DecimalToHexaDecimal(n);
        HexaDecimalToDecimal();
        
    }
}
