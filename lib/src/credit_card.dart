import "package:meta/meta.dart";

@immutable
class CreditCard {
  static const int _minNumber = 1000000000000000;

  final int number;
  final int code;
  final String cardHolderName;
  final DateTime date;

  CreditCard(this.number, this.code, this.cardHolderName, this.date)
      : assert(number ~/ _minNumber >= 1 && number ~/ _minNumber < 10),
        assert(cardHolderName.contains(" ") && cardHolderName.isNotEmpty),
        assert(DateTime.now().year < date.year &&
            (DateTime.now().year == date.year
                ? DateTime.now().month < date.month
                : true));

  CreditCard.fromFormattedString(
      String formattedNumber, int code, String cardHolderName, DateTime date)
      : this(int.parse(formattedNumber.replaceAll(" ", "")), code,
            cardHolderName, date);
}
