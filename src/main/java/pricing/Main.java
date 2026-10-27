package pricing;

/*
 * This is the driver code. Don't change it!
 */
public class Main {
    public static void main(String[] args) {
        if (args.length == 0) {
            throw new IllegalArgumentException("No command line arguments passed");
        }
        OrderProcessor.processOrder(args[0]);
    }
}
