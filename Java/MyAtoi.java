import java.util.*;

// Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.
// The algorithm for myAtoi(string s) is as follows:
// Whitespace: Ignore any leading whitespace (" ").
// Signedness: Determine the sign by checking if the next character is '-' or '+', assuming positivity is 
// neither present.
// Conversion: Read the integer by skipping leading zeros until a non-digit character is encountered or the
// end of the string is reached. If no digits were read, then the result is 0.
// Rounding: If the integer is out of the 32-bit signed integer range [-231, 231-1], then round the integer to
// remain in the range. Specifically, integers less than -231 should be rounded to -231, and integers greater
// than 231 - 1 should be rounded to 231 - 1.
// Return the integer as the final result.
// Input: s = " -042"
// Output: -42
// Explanation:
// Step 1: " -042" (leading whitespace is read and ignored)
// Step 2: " -042" ('-' is read, so the result should be negative)
// Step 3: " -042" ("042" is read in, leading zeros ignored in the result)

public class Program39 {

    public static int myAtoi(String str){
        str = str.trim();
        int n = str.length();
        int sum = 0;
        int IsPlus = 1;
        int IsAlpha = 0;
        
        if(str.charAt(0)=='-') IsPlus = 0;

        for(int i=0; i<n; i++){

            if(str.charAt(i) > 57){
                IsAlpha++;
                if(IsAlpha>=1){
                    sum = 0;
                    return sum;
                }
            }
            else{
                sum = sum * 10 + (str.charAt(i) - '0');
            }

            if(str.charAt(0)=='-'){
                if((str.charAt(i) - '0') > 9 || str.charAt(i)==' '){
                    continue;
                }
                else{
                    sum = sum * 10 + (str.charAt(i) - '0');
                }
                    
            }
            else{
                i--;
                if((str.charAt(i) - '0') > 9 || str.charAt(i)==' '){
                    i++;
                }
                else{
                    sum = sum * 10 + (str.charAt(i) - '0');
                }
            }
        }

        if(IsPlus == 0) sum = sum*(-1);

        return sum;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Input : ");
        String str = sc.nextLine();
        int ans = myAtoi(str);
        System.out.print("Output : "+ans);
    }
}
