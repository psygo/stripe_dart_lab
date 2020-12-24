import "package:meta/meta.dart";

@immutable
class CreditCard {
  static const int _minNumber = 1000000000000000;
  static const int _minCode = 100;

  final int number;
  final int code;
  final String cardHolderName;

  CreditCard(this.number, this.code, this.cardHolderName)
      : assert(number ~/ _minNumber >= 1 && number ~/ _minNumber < 10),
        assert(code ~/ _minCode >= 1 && code ~/ _minCode < 10),
        assert(cardHolderName.contains(" ") && cardHolderName.isNotEmpty);

  CreditCard.fromFormattedString(
      String formattedNumber, int code, String cardHolderName)
      : this(int.parse(formattedNumber.replaceAll(" ", "")), code,
            cardHolderName);
}
