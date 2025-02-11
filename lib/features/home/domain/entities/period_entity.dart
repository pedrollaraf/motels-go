import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/data/models.dart';

class PeriodEntity {
  final String duration;
  final Decimal price;
  final Discount? discount;
  final Decimal totalPrice;
  final bool hasCourtesy;
  final String formattedDuration;

  PeriodEntity({
    required this.duration,
    required this.price,
    this.discount,
    required this.totalPrice,
    required this.hasCourtesy,
    required this.formattedDuration,
  });
}
