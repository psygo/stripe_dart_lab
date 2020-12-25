import "package:meta/meta.dart";
import "package:quiver/core.dart";

import "datetime_operator_extension.dart";

@immutable
class CreditCard {
  static final CreditCard johnDoe = CreditCard(
      number: CardNumber(4242424242424242),
      cvc: Cvc(123),
      name: CardHolderName("John Doe"),
      date: ExpirationDate(DateTime(2019, 1));

  final CardNumber number;
  final Cvc cvc;
  final CardHolderName name;
  final DateTime date;

  const CreditCard({
    @required this.number,
    @required this.cvc,
    @required this.name,
    @required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCard &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          cvc == other.cvc &&
          name == other.name &&
          date == other.date;

  @override
  int get hashCode => hash4(number, cvc, name, date);
}

@immutable
class CardNumber {
  static const int _minNumber = 1000000000000000;

  final int number;

  const CardNumber(this.number)
      : assert(number ~/ _minNumber >= 1 && number ~/ _minNumber < 10);

  String get formatted {
    final String toString = number.toString();
    String formatted = "";
    for (int i = 0; i < toString.length; i++) {
      if (i % 4 == 0 && i > 0) formatted += " ";
      formatted += toString[i];
    }
    return formatted;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardNumber &&
          runtimeType == other.runtimeType &&
          number == other.number;

  @override
  int get hashCode => number;
}

@immutable
class Cvc {
  final int number;

  const Cvc(this.number);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cvc &&
          runtimeType == other.runtimeType &&
          number == other.number;

  String get formatted => number.toString().padLeft(3, "0");

  @override
  int get hashCode => number;
}

@immutable
class CardHolderName {
  final String name;

  CardHolderName(this.name) : assert(name.contains(" ") && name.isNotEmpty);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardHolderName &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}

@immutable
class ExpirationDate {
  final DateTime date;

  ExpirationDate(this.date) : assert(date < DateTime.now());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpirationDate &&
          runtimeType == other.runtimeType &&
          date.equals(other.date);

  int get year => date.year;

  int get month => date.month;

  @override
  int get hashCode => date.hashCode;
}
