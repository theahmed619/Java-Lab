package anagram;

import java.util.Arrays;

public class Anagram {

    public static void main(String[] args) {
        String x="listen";
        String y="silunT";

        x=x.replace(" ","");
        y=y.replace(" ","");
        x=x.toLowerCase();
        y=y.toLowerCase();

        char a[] = x.toCharArray();
        char b[]=y.toCharArray();

        Arrays.sort(a);
        Arrays.sort(b);

        boolean result=Arrays.equals(a,b);
        if(result==true){
            System.out.println("Anagram!!!");
        }else System.out.println("Not");

    }

}
