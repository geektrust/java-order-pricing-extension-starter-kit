package pricing;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

public class OrderProcessor {

    private static final String[] CATEGORY_NAMES = {"Electronics", "Books", "Clothing"};
    private static final int[] CATEGORY_SHIPPING_PER_ITEM = {10, 0, 5};

    private static final int CATEGORIES_FOR_FREE_SHIPPING = 3;

    public static void processOrder(String input) {
        String[] parts = input.split(" ");
        String customerType = parts[0];

        if (!customerType.equals("Regular")
                && !customerType.equals("Member")
                && !customerType.equals("VIP")) {
            System.out.println("INVALID CUSTOMER TYPE");
            return;
        }

        int itemTotal = 0;
        int shippingTotal = 0;
        Set<String> categoriesInOrder = new HashSet<>();

        for (int i = 1; i < parts.length; i++) {
            String[] fields = parts[i].split(":");
            String category = fields[0];
            int price = Integer.parseInt(fields[1]);
            int quantity = Integer.parseInt(fields[2]);

            int categoryIndex = findCategoryIndex(category);
            if (categoryIndex < 0) {
                System.out.println("INVALID CATEGORY");
                return;
            }

            categoriesInOrder.add(category);
            itemTotal += price * quantity;
            shippingTotal += CATEGORY_SHIPPING_PER_ITEM[categoryIndex] * quantity;
        }

        int discountPercent = 0;
        if (customerType.equals("Member")) {
            discountPercent = 10;
        } else if (customerType.equals("VIP")) {
            discountPercent = 20;
        }

        double total = itemTotal - itemTotal * discountPercent / 100.0;

        boolean freeShipping = customerType.equals("VIP")
                || categoriesInOrder.size() >= CATEGORIES_FOR_FREE_SHIPPING;
        if (!freeShipping) {
            total += shippingTotal;
        }

        System.out.println("Order Total: " + String.format(Locale.ROOT, "%.2f", total));
    }

    private static int findCategoryIndex(String category) {
        for (int i = 0; i < CATEGORY_NAMES.length; i++) {
            if (CATEGORY_NAMES[i].equals(category)) {
                return i;
            }
        }
        return -1;
    }
}
