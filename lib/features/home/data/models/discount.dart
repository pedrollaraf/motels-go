import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class Discount {
  final double discountAmount;

  Discount({required this.discountAmount});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(discountAmount: (json['desconto'] as num?)?.toDouble() ?? 0.0);
  }

  DiscountEntity toEntity() {
    return DiscountEntity(
      discountAmount: Decimal(
        formattedValue: discountAmount.formatToDouble(),
        doubleValue: discountAmount,
      ),
    );
  }
}
