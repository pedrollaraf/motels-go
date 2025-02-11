import 'package:moteis_go/features/home/domain/entities.dart';

class SuiteItem {
  final String name;

  SuiteItem({required this.name});

  factory SuiteItem.fromJson(Map<String, dynamic> json) {
    return SuiteItem(name: json['nome'] ?? '');
  }

  SuiteItemEntity toEntity() {
    return SuiteItemEntity(
      name: name,
    );
  }
}
