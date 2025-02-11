import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/data/models.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class Period {
  final String duration;
  final double price;
  final Discount? discount;
  final double totalPrice;
  final bool hasCourtesy;
  final String formattedDuration;

  Period({
    required this.duration,
    required this.price,
    this.discount,
    required this.totalPrice,
    required this.hasCourtesy,
    required this.formattedDuration,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      duration: json['tempo'] ?? '',
      price: (json['valor'] as num?)?.toDouble() ?? 0.0,
      discount: json['desconto'] != null ? Discount.fromJson(json['desconto']) : null,
      totalPrice: (json['valorTotal'] as num?)?.toDouble() ?? 0.0,
      hasCourtesy: json['temCortesia'] ?? false,
      formattedDuration: json['tempoFormatado'] ?? '',
    );
  }

  PeriodEntity toEntity() {
    return PeriodEntity(
      duration: duration,
      price: Decimal(
        formattedValue: price.formatToDouble(),
        doubleValue: price,
      ),
      discount: discount?.toEntity(),
      totalPrice: Decimal(
        formattedValue: totalPrice.formatToDouble(),
        doubleValue: totalPrice,
      ),
      hasCourtesy: hasCourtesy,
      formattedDuration: formattedDuration,
    );
  }
}
