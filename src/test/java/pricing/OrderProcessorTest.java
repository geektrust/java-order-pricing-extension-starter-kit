package pricing;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import org.junit.jupiter.api.Test;

class OrderProcessorTest {

    @Test
    void regularCustomerBuyingBooksPaysNoShipping() {
        PrintStream originalOut = System.out;
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        System.setOut(new PrintStream(output));
        try {
            OrderProcessor.processOrder("Regular Books:15:2");
        } finally {
            System.setOut(originalOut);
        }

        assertEquals("Order Total: 30.00", output.toString().trim());
    }
}
