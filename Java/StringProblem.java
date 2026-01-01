import java.util.*;

public class StringProblem {

    // Given a string S of length n, the task is to find the earliest repeated character in it. The earliest repeated
    // character means, the character that occurs more than once and whose second occurrence has the
    // smallest index.
    // Input: s = "geeksforgeeks"
    // Output: e 
    public static void FirstRepeatedChar(String str) {  
        int n = str.length();
        int flag=0;

        for (int i = 0; i < n; i++) {
            if(flag==1){
                break;
            }
            for (int j = 0; j < i; j++) {
                if(str.charAt(i)==str.charAt(j)){
                    System.out.print("Outpur : "+str.charAt(i));
                    flag=1;
                    break;
                }
            }
        }
    }

    //str.charAt(i);
    //str.indexOf('l');
    // Write a program that should decode the given pattern and print the resulting expanded string.
    // Input: 2ac3b4dE5F2G7H
    // Output: aabbbcddddEFFFFFGGHHHHHHH
    public static void DecodePattern(String str) {  
        int n = str.length();
        
        for (int i = 0; i < n; ) {
            int k = 0;
            while (i < n && Character.isDigit(str.charAt(i))) {
                k = k * 10 + (str.charAt(i) - '0');
                i++;
            }
            if (i < n) {
                char ch = str.charAt(i);

                if (k == 0) k = 1;

                for (int j = 0; j < k; j++) {
                    System.out.print(ch);
                }
                i++;
            }
        }
    }

    // Given two strings s1 and s2 consisting of lowercase characters, the task is to check whether the two given
    // strings are anagrams of each other or not. An anagram of a string is another string that contains the same
    // characters, only the order of characters can be different.
    // Input: s1 = geeks s2 = kseeg
    // Output: true
    public static boolean CheckAnagramStrings(String str1, String str2){
        int n1 = str1.length();
        int n2 = str2.length();
        int c=0;

        if(n1!=n2) return false;

        for(int i=0; i<n1; i++){
            if(c==n1) return true;
            for(int j=0; j<n1; j++){
                for(int k=0; k<n1; k++){
                    if(str1.charAt(j)==str2.charAt(k)){
                        c++;
                        break;
                    }
                }
            }
        }

        return false;
    }

    // Take an Input in the form of Binary String that contains only 0’s and 1’s and convert this number into
    // integer.
    // Input: 101.110
    // Output: 5.75
    public static double BinaryToDecimal(String str){
        String[] str2 = str.split("\\.");
        String p1 = str2[0];
        String p2 = str2[1];
        int sum1=0;
        double sum2=0;
        int k1=0, k2=-1;

        for(int i=p1.length()-1; i>=0; i--){
            if(p1.charAt(i)=='1') sum1 = sum1 + (int) Math.pow(2, k1);
            k1++;
        }
        for(int i=0; i<p2.length(); i++){
            if(p2.charAt(i)=='1') sum2 = sum2 + Math.pow(2, k2);
            k2--;
        }

        double ans = sum1+sum2;

        return ans;
    }

    

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // System.out.print("Enter a string: ");
        // String str = sc.nextLine();
        // DecodePattern(str);

        // System.out.print("Input : ");
        // String str2 = sc.nextLine();
        // FirstRepeatedChar(str2);

        // System.out.print("String-1 : ");
        // String str31 = sc.nextLine();
        // System.out.print("String-2 : ");
        // String str32 = sc.nextLine();
        // boolean ans = CheckAnagramStrings(str31, str32);
        // System.out.print("Answer : "+ans);

        System.out.print("Input : ");
        String str4 = sc.nextLine();
        double ans4 = BinaryToDecimal(str4);
        System.out.print("Output : "+ans4);
    }
}
