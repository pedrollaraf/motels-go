import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/data/models.dart';

class MotelData {
  final int page;
  final int itemsPerPage;
  final int totalSuites;
  final int totalMoteis;
  final double radius;
  final int maxPages;
  final List<Motel> moteis;

  MotelData({
    required this.page,
    required this.itemsPerPage,
    required this.totalSuites,
    required this.totalMoteis,
    required this.radius,
    required this.maxPages,
    required this.moteis,
  });

  factory MotelData.fromJson(Map<String, dynamic> json) {
    return MotelData(
      page: json['pagina'] ?? 1,
      itemsPerPage: json['qtdPorPagina'] ?? 10,
      totalSuites: json['totalSuites'] ?? 0,
      totalMoteis: json['totalMoteis'] ?? 0,
      radius: (json['raio'] ?? 0.0).toDouble(),
      maxPages: json['maxPaginas'] ?? 1,
      moteis: (json['moteis'] as List<dynamic>?)?.map((e) => Motel.fromJson(e)).toList() ?? [],
    );
  }

  MotelDataEntity toEntity() {
    return MotelDataEntity(
      page: page,
      itemsPerPage: itemsPerPage,
      totalSuites: totalSuites,
      totalMoteis: totalMoteis,
      radius: Decimal(
        formattedValue: radius.formatToDouble(),
        doubleValue: radius,
      ),
      maxPages: maxPages,
      moteis: moteis.map((motel) => motel.toEntity()).toList(),
    );
  }
}
