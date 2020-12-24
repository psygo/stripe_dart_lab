import "package:test/test.dart";

import "package:stripe_demo/stripe_demo.dart";

void main() {
  test("Basic initialization", () {
    // 1) Default Constructor
    final CreditCard creditCard1 = CreditCard(
        int.parse("4242 4242 4242 4242".replaceAll(" ", "")), 123, "John Doe");

    expect(creditCard1, isA<CreditCard>());
    expect(creditCard1.number, 4242424242424242);
    expect(creditCard1.cardHolderName, "John Doe");
    expect(creditCard1.code, 123);

    // 2) fromFormattedString
    final CreditCard creditCard2 =
        CreditCard.fromFormattedString("4242 4242 4242 4242", 123, "John Doe");

    expect(creditCard2, isA<CreditCard>());
    expect(creditCard2.number, 4242424242424242);
    expect(creditCard2.cardHolderName, "John Doe");
    expect(creditCard2.code, 123);
  });

  test("Card Edge Cases", () {

  });
}
