package factorial;

public class RecurseFacto {

    static  int fact=1;
    public static void main(String[] args) {
        int n=5;
        int res=facto(5);
        System.out.println(res);
    }

    static  int facto(int n){
        if(n>0){

            fact*=n;
            facto(n-1);

        }
        return fact;
    }
}
