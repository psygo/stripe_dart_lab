import "package:test/test.dart";

import "package:stripe_dart_lab/stripe_dart_lab.dart";

void main() {
  test("equals", () {
    final DateTime baseDate = DateTime(2020, 9);

    // 1) Only Year
    expect(baseDate.equals(DateTime(2020, 8)), isFalse);
    expect(baseDate.equals(DateTime(2020, 10)), isFalse);

    // 2) Only Month
    expect(baseDate.equals(DateTime(2021, 9)), isFalse);
    expect(baseDate.equals(DateTime(2019, 9)), isFalse);

    // 3) Year and Month
    expect(baseDate.equals(DateTime(2020, 9, 10)), isTrue);
  });

  test("< and <=", () {
    final DateTime baseDate = DateTime(2020, 9);

    // 1) Year
    expect(baseDate < DateTime(2021, 9, 10), isTrue);
    expect(baseDate < DateTime(2019, 9, 10), isFalse);
    expect(baseDate <= DateTime(2021, 9, 10), isTrue);
    expect(baseDate <= DateTime(2019, 9, 10), isFalse);

    // 2) Month
    expect(baseDate < DateTime(2020, 10, 10), isTrue);
    expect(baseDate < DateTime(2020, 8, 10), isFalse);
    expect(baseDate <= DateTime(2020, 10, 10), isTrue);
    expect(baseDate <= DateTime(2020, 8, 10), isFalse);

    // 3) Year and Month
    expect(baseDate < DateTime(2021, 12, 10), isTrue);
    expect(baseDate < DateTime(2019, 8, 10), isFalse);
    expect(baseDate <= DateTime(2021, 12, 10), isTrue);
    expect(baseDate <= DateTime(2019, 8, 10), isFalse);

    // 4) Same date returns false if <
    expect(baseDate < DateTime(2020, 9, 10), isFalse);

    // 5) Same date returns true if <=
    expect(baseDate <= DateTime(2020, 9, 10), isTrue);
  });

  test("> and >=", () {
    final DateTime baseDate = DateTime(2020, 9);

    // 1) Year
    expect(baseDate > DateTime(2021, 9, 10), isFalse);
    expect(baseDate > DateTime(2019, 9, 10), isTrue);
    expect(baseDate >= DateTime(2021, 9, 10), isFalse);
    expect(baseDate >= DateTime(2019, 9, 10), isTrue);

    // 2) Month
    expect(baseDate > DateTime(2020, 10, 10), isFalse);
    expect(baseDate > DateTime(2020, 8, 10), isTrue);
    expect(baseDate >= DateTime(2020, 10, 10), isFalse);
    expect(baseDate >= DateTime(2020, 8, 10), isTrue);

    // 3) Year and Month
    expect(baseDate > DateTime(2021, 12, 10), isFalse);
    expect(baseDate > DateTime(2019, 8, 10), isTrue);
    expect(baseDate >= DateTime(2021, 12, 10), isFalse);
    expect(baseDate >= DateTime(2019, 8, 10), isTrue);

    // 4) Same date returns false if >
    expect(baseDate > DateTime(2020, 9, 10), isFalse);

    // 5) Same date returns true if >=
    expect(baseDate >= DateTime(2020, 9, 10), isTrue);
  });
}
