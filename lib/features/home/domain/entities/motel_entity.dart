import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class MotelEntity {
  final String logo;
  final Decimal rating;
  final String neighborhood;
  final List<SuiteEntity> suites;
  final String fantasyName;
  final Decimal distance;
  final int favoriteCount;
  final int reviewCount;

  MotelEntity({
    required this.logo,
    required this.rating,
    required this.neighborhood,
    required this.suites,
    required this.fantasyName,
    required this.distance,
    required this.favoriteCount,
    required this.reviewCount,
  });
}
