package arrays;

import java.util.Arrays;

public class SecondLargest {
    public static void main(String[] args) {
        int[] a = {111, 1, 33, 22, 2, 5, 333};
//        Arrays.sort(a); // Sorts the array in ascending order  //1,2,5,22,33,111,333
//        int secondLargest = a[a.length - 2]; // Second last element is the second largest
//        System.out.println("Second largest element is: " + secondLargest);

        bubbleSort(a);
    }

    static  void bubbleSort(int[] a){
        int temp;
        for(int i=0;i<a.length;i++){
            int flag=0;
            for (int j=0;j<a.length-1-i;j++){
                if(a[j]>a[j+1]){
                    temp=a[j];
                    a[j]=a[j+1];
                    a[j+1]=temp;
                    flag=1;
                }
            }
            if(flag==0){
                break;
            }
        }
        int secondLargestNumber=a[a.length-2];
        System.out.println(secondLargestNumber);
    }
}
