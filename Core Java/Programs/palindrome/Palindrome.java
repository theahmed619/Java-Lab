package palindrome;

public class Palindrome {


    public static void main(String[] args) {
        int no=1221;
        int temp=no;
        int rev=0,rem;
        while (no!=0){
            rem=no%10;
            rev=rev*10+rem;
            no=no/10;
        }
        if(rev==temp){
            System.out.println("Number is Palindrome");
        }else{
            System.out.println("Not");
        }
    }
}
