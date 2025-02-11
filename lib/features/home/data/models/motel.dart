import 'package:moteis_go/common/commons.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/data/models.dart';

class Motel {
  final String logo;
  final double rating;
  final String neighborhood;
  final List<Suite> suites;
  final String fantasyName;
  final double distance;
  final int favoriteCount;
  final int reviewCount;

  Motel({
    required this.logo,
    required this.rating,
    required this.neighborhood,
    required this.suites,
    required this.fantasyName,
    required this.distance,
    required this.favoriteCount,
    required this.reviewCount,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      logo: json['logo'] ?? '',
      rating: (json['media'] as num?)?.toDouble() ?? 0.0,
      neighborhood: json['bairro'] ?? '',
      fantasyName: json['fantasia'] ?? '',
      distance: (json['distancia'] as num?)?.toDouble() ?? 0.0,
      favoriteCount: json['qtdFavoritos'] ?? 0,
      reviewCount: json['qtdAvaliacoes'] ?? 0,
      suites: (json['suites'] as List).map((e) => Suite.fromJson(e)).toList(),
    );
  }

  MotelEntity toEntity() {
    return MotelEntity(
      logo: logo,
      rating: Decimal(formattedValue: rating.formatToDouble(), doubleValue: rating),
      neighborhood: neighborhood,
      fantasyName: fantasyName,
      distance: Decimal(formattedValue: distance.formatToDouble(), doubleValue: distance),
      favoriteCount: favoriteCount,
      reviewCount: reviewCount,
      suites: suites.map((suite) => suite.toEntity()).toList(),
    );
  }
}
