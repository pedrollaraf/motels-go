import 'package:intl/intl.dart';

extension StringExtension on String? {
  double toDoublePtBr() {
    if (this == null || this!.isEmpty) {
      return 0.00;
    }
    try {
      NumberFormat format = NumberFormat.decimalPattern('pt_BR');
      return format.parse(this!).toDouble();
    } catch (e) {
      return 0.00;
    }
  }
}
