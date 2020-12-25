import "package:meta/meta.dart";

import "datetime_operator_extension.dart";

@immutable
class CreditCard {
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
}

@immutable
class CardNumber {
  static const int _minNumber = 1000000000000000;

  final int number;

  const CardNumber(this.number)
      : assert(number ~/ _minNumber >= 1 && number ~/ _minNumber < 10);

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

  @override
  int get hashCode => date.hashCode;
}
