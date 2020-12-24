/// The credit card context doesn't take into consideration date data that's
/// beyond year and month.
extension DateTimeOperatorExtension on DateTime {
  /// An equals method which only takes year and month into consideration.
  bool equals(DateTime date) => year == date.year && month == date.month;

  bool operator <(DateTime date) =>
      year < date.year ? true : month < date.month;

  bool operator <=(DateTime date) => this < date || equals(date);

  bool operator >(DateTime date) => !(this <= date);

  bool operator >=(DateTime date) => !(this < date);
}
