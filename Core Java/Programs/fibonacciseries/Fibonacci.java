package fibonacciseries;

public class Fibonacci {
    static int a=0, b=1,c;
    public static void main(String[] args) {


       System.out.println(a);
       System.out.println(b);
//        for(int i=1;i<=10;i++){
//             c=a+b; //0+1 ->0,1,1,2,3,5
//            System.out.println(c);
//            a=b;
//            b=c;


        fib(10);
        }

    static  void fib(int i){

       if(i>=1){
        c=a+b;
            System.out.println(c);
            a=b;
            b=c;
            fib(i-1);
        }

    }
    }



