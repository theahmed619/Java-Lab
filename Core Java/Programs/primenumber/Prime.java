package primenumber;

import java.util.Scanner;

public class Prime {
    public static void main(String[] args) {
//        int n=6;
//        int temp=0;
//        for (int i=2;i<=n-1;i++){
//            if(n%i==0){
//                temp=temp+1;
//            }
//        }
//        if(temp==0){
//            System.out.println("Number is not prime");
//        }else{
//            System.out.println("Number is Prime");
//        }

        Scanner sc=new Scanner(System.in);
        System.out.println("Enter N number");
        int n=sc.nextInt();
        printPrimeNumbers(n);
    }

    static  void printPrimeNumbers(int n){

        for(int i=2; i<=n;i++){
            int temp=0;
            for(int j=2;j<=i-1;j++){
                if(i%j==0){
                    temp+=1;
                }
            }
            if(temp==0){
                System.out.println(i);
            }
        }

    }
}
