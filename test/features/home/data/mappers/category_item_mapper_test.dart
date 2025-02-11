import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('CategoryItem', () {
    test('CategoryItem.fromJson should correctly convert JSON to entity', () {
      final json = {
        'nome': 'Categoria Teste',
        'icone': 'icone_teste.png',
      };

      final categoryItem = CategoryItem.fromJson(json);

      expect(categoryItem.name, 'Categoria Teste');
      expect(categoryItem.icon, 'icone_teste.png');
    });

    test('CategoryItem.toEntity must correctly convert entity to entity', () {
      final categoryItem = CategoryItem(name: 'Categoria Teste', icon: 'icone_teste.png');
      final entity = categoryItem.toEntity();

      expect(entity.name, 'Categoria Teste');
      expect(entity.icon, 'icone_teste.png');
    });
  });
}
