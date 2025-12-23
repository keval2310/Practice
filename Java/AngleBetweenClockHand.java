import java.util.Scanner;

public class AngleBetweenClockHand {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Hour   = ");
        int h = sc.nextInt();
        System.out.print("Minute = ");
        int m = sc.nextInt();

        if(h==12) h = 0;

        double angle, a1, a2;

        a1 = (double)(5.5*m - 30*h);
        a2 = 360 - (double)(5.5*m - 30*h);

        angle = (a1<=a2)?a1:a2;

        if(angle<0) angle = angle*(-1);

        System.out.println("Angle = "+angle);
    }
}