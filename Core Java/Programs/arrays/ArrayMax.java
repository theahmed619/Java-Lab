package arrays;

public class ArrayMax {

    public static void main(String[] args) {
        int[] x={1,3,222,6,5,77,11,88};
        int max=x[0];

        for (int i=1;i<x.length;i++){
            if(max<x[i]){
                max=x[i];
            }
        }
        System.out.println("Max = "+max );
    }


}
