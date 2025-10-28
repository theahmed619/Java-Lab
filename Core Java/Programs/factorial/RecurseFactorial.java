package factorial;

public class RecurseFactorial {
    public static void main(String[] args) {
        int n = 5;
        int res = facto(n); // Compute factorial of 5
        System.out.println(res); // Output: 120
    }

    static int facto(int n) {
        if (n == 0 || n == 1) {
            return 1; // Base case: 0! = 1 and 1! = 1
        }
        return n * facto(n - 1); // Recursive case: n! = n * (n-1)!
    }
}
