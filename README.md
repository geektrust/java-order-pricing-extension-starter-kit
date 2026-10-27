# order-pricing-starter-kit

## Introduction

This is a skeleton project structure which will help you start solving the **Order Pricing** problem right away.

It contains the existing production code (`Main.java` and `OrderProcessor.java`) and one example unit test. The project is built and tested with **Maven**.

## Tools available to you

- Java 17 (any JDK 17 or newer works)
- Apache Maven 3.6+ (configured by `pom.xml`)
- JUnit 5 (5.10.2), the unit testing framework used for writing and running tests

## Structure

```
.
├── src
│   ├── main/java/pricing
│   │   ├── Main.java              # Driver code. Do NOT change this file.
│   │   └── OrderProcessor.java    # Existing pricing logic.
│   └── test/java/pricing
│       └── OrderProcessorTest.java  # One example test to start from.
├── pom.xml              # Maven build config
├── run.sh               # Compile and run the program against inputs
├── run_unittests.sh     # Run all unit tests
├── runner.json          # Used by the Geektrust IDE to check your output against the examples
└── README.md
```

- **src/main/java** is where your Java source files go. `Main.java` contains the driver code and must not be changed. You may change every other file.
- **src/test/java** is where your unit tests go. Name test classes so that they end with `Test.java` (for example `OrderProcessorTest.java`, `CustomerTypeTest.java`) so Maven picks them up.

## How to run the unit tests

```bash
mvn test
```

or

```bash
./run_unittests.sh
```

Test reports are written to `target/surefire-reports/`.

## How to build your solution

`mvn package` compiles the code, runs the tests and builds `target/order-pricing-1.0.0.jar`.

## How to run the program

The program takes **one** argument: the whole order as a single string. Always wrap it in single quotes so your shell passes it as one argument.

```bash
./run.sh 'Regular Electronics:100:1 Books:20:2'
# Order Total: 150.00
```

You can pass several inputs at once; the program runs once for each:

```bash
./run.sh 'Member Clothing:15:1' 'Guest Books:10:1' 'Regular Toys:10:1'
# Order Total: 18.50
# INVALID CUSTOMER TYPE
# INVALID CATEGORY
```

Running directly:

```bash
mvn -q compile
java -cp target/classes pricing.Main 'Regular Electronics:100:1 Books:20:2'
```

## Commands available to you

| Task | Command |
|------|---------|
| Clean old builds | `mvn clean` |
| Compile | `mvn compile` |
| Run unit tests | `mvn test` |
| Build the jar | `mvn package` |

## Checking for correctness

The problem statement lists example inputs and expected outputs, both for the current behaviour and for after your changes. A quick way to check the current ones:

```bash
./run.sh \
  'Regular Electronics:100:1 Books:20:2' \
  'Member Electronics:100:1 Clothing:30:2' \
  'VIP Electronics:200:1' \
  'Regular Electronics:50:1 Books:10:1 Clothing:20:1' \
  'Member Electronics:100:1 Books:20:1 Clothing:30:1' \
  'Regular Books:10:1 Books:5:2' \
  'Member Clothing:15:1' \
  'Guest Books:10:1' \
  'Regular Toys:10:1' \
  'Regular Books:10:1 Toys:5:1' \
  'Guest Toys:10:1'
```

Expected output:

```
Order Total: 150.00
Order Total: 164.00
Order Total: 160.00
Order Total: 80.00
Order Total: 135.00
Order Total: 20.00
Order Total: 18.50
INVALID CUSTOMER TYPE
INVALID CATEGORY
INVALID CATEGORY
INVALID CUSTOMER TYPE
```

Remember: the best way to prove existing behaviour is preserved is with unit tests, written before you change the code.
