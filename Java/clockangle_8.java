import java.util.Scanner;

public class clockangle_8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int hour;
        int minute;
        double angle;

        System.out.print("Enter hour: ");
        hour = sc.nextInt();

        System.out.print("Enter minute: ");
        minute = sc.nextInt();

        angle = Math.abs(30 * hour - 5.5 * minute);

        if (angle > 180) {
            angle = 360 - angle;
        }

        System.out.println("Angle between hands = " + angle);
    }
}