package swapping;

public class Swap {
    public static void main(String[] args) {
        int a=2;
        int b=3;
        System.out.println("a =" +a);
        System.out.println("b =" +b);

        System.out.println("After swapppp");
        a=a+b;
        b=a-b;
        a=a-b;

        System.out.println("a =" +a);
        System.out.println("b =" +b);
    }
}
