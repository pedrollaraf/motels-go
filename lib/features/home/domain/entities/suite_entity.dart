import 'package:moteis_go/features/home/domain/entities.dart';

class SuiteEntity {
  final int quantity;
  final String name;
  final List<String> photos;
  final List<SuiteItemEntity> items;
  final List<PeriodEntity> periods;
  final List<CategoryItemEntity> categoryItems;
  final bool showAvailableQuantity;

  SuiteEntity({
    required this.quantity,
    required this.name,
    required this.photos,
    required this.items,
    required this.periods,
    required this.categoryItems,
    required this.showAvailableQuantity,
  });
}
