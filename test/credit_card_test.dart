import "package:test/test.dart";

import "package:stripe_demo/stripe_demo.dart";

void main() {
  test("Basic initialization", () {
    // 1) Default Constructor
    final CreditCard creditCard1 = CreditCard(
        int.parse("4242 4242 4242 4242".replaceAll(" ", "")),
        123,
        "John Doe",
        DateTime(2021, 10, 1));

    expect(creditCard1, isA<CreditCard>());
    expect(creditCard1.number, 4242424242424242);
    expect(creditCard1.cardHolderName, "John Doe");
    expect(creditCard1.code, 123);

    // 2) fromFormattedString
    final CreditCard creditCard2 = CreditCard.fromFormattedString(
        "4242 4242 4242 4242", 123, "John Doe", DateTime(2021, 10, 1));

    expect(creditCard2, isA<CreditCard>());
    expect(creditCard2.number, 4242424242424242);
    expect(creditCard2.cardHolderName, "John Doe");
    expect(creditCard2.code, 123);
  });

  test("Edge Cases", () {
    const TypeMatcher<AssertionError> isAssertionError =
        TypeMatcher<AssertionError>();
    final Matcher throwsAssertionError = throwsA(isAssertionError);

    // 1) The card number must have 16 digits and must start with a number >= 1
    expect(
        () => CreditCard.fromFormattedString(
            "0999 9999 9999 9999", 123, "John Doe", DateTime(2021, 10, 1)),
        throwsAssertionError);
    expect(
        () => CreditCard.fromFormattedString(
            "0000 0000 0000 0000", 123, "John Doe", DateTime(2021, 10, 1)),
        throwsAssertionError);

    // 2) The card holder's name must have 2 names and must be separated by
    // spaces
    expect(
        () => CreditCard.fromFormattedString(
            "4242 4242 4242 4242", 123, "", DateTime(2021, 10, 1)),
        throwsAssertionError);
    expect(
        () => CreditCard.fromFormattedString(
            "4242 4242 4242 4242", 123, "JD", DateTime(2021, 10, 1)),
        throwsAssertionError);

    // 3) The date must be in the future
    expect(
        () => CreditCard.fromFormattedString(
            "4242 4242 4242 4242", 123, "John Doe", DateTime(2019, 10, 1)),
        throwsAssertionError);
  });
}
