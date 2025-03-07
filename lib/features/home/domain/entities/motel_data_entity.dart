import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class MotelDataEntity {
  final int page;
  final int itemsPerPage;
  final int totalSuites;
  final int totalMoteis;
  final Decimal radius;
  final Decimal maxPages;
  final List<MotelEntity> motels;

  MotelDataEntity({
    required this.page,
    required this.itemsPerPage,
    required this.totalSuites,
    required this.totalMoteis,
    required this.radius,
    required this.maxPages,
    required this.motels,
  });
}
