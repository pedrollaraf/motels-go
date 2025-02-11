import 'package:moteis_go/features/home/data/models.dart';
import 'package:moteis_go/features/home/domain/entities.dart';

class Suite {
  final int quantity;
  final String name;
  final List<String> photos;
  final List<SuiteItem> items;
  final List<Period> periods;
  final List<CategoryItem> categoryItems;
  final bool showAvailableQuantity;

  Suite({
    required this.quantity,
    required this.name,
    required this.photos,
    required this.items,
    required this.periods,
    required this.categoryItems,
    required this.showAvailableQuantity,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      quantity: json['qtd'] ?? 0,
      name: json['nome'] ?? '',
      photos: List<String>.from(json['fotos'] ?? []),
      items: (json['itens'] as List).map((e) => SuiteItem.fromJson(e)).toList(),
      periods: (json['periodos'] as List).map((e) => Period.fromJson(e)).toList(),
      categoryItems: (json['categoriaItens'] as List).map((e) => CategoryItem.fromJson(e)).toList(),
      showAvailableQuantity: json['exibirQtdDisponiveis'] ?? false,
    );
  }

  SuiteEntity toEntity() {
    return SuiteEntity(
      quantity: quantity,
      name: name,
      photos: photos,
      showAvailableQuantity: showAvailableQuantity,
      items: items.map((item) => item.toEntity()).toList(),
      periods: periods.map((period) => period.toEntity()).toList(),
      categoryItems: categoryItems.map((categoryItems) => categoryItems.toEntity()).toList(),
    );
  }
}
