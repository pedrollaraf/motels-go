import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String formatToCurrency() {
    var formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
      decimalDigits: 2,
    );
    return formatter.format(this).trim();
  }

  String formatToDouble() {
    var formatter = NumberFormat.decimalPattern(
      'pt_BR',
    );
    return formatter.format(this).trim();
  }
}
