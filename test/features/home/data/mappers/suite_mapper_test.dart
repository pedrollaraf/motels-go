import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('Suite', () {
    test('Suite.fromJson should correctly convert JSON to entity', () {
      final json = {
        'qtd': 2,
        'nome': 'Suite Teste',
        'fotos': [],
        'itens': [
          {'nome': 'Item 1'}
        ],
        'periodos': [
          {'tempo': '1 hora', 'valor': 50.0}
        ],
        'categoriaItens': [
          {'nome': 'Categoria 1', 'icone': 'icone1'}
        ],
        'exibirQtdDisponiveis': true
      };

      final suite = Suite.fromJson(json);

      expect(suite.quantity, 2);
      expect(suite.name, 'Suite Teste');
      expect(suite.photos.length, 0);
      expect(suite.items.length, 1);
      expect(suite.periods.length, 1);
      expect(suite.categoryItems.length, 1);
      expect(suite.showAvailableQuantity, true);
    });

    test('Suite.toEntity must correctly convert entity to entity', () {
      final suite = Suite(
        quantity: 2,
        name: 'Suite Teste',
        photos: [],
        items: [SuiteItem(name: 'Item 1')],
        periods: [Period(duration: '1 hora', price: 50.0, totalPrice: 45.0, hasCourtesy: true, formattedDuration: '1h')],
        categoryItems: [CategoryItem(name: 'Categoria 1', icon: 'icone1')],
        showAvailableQuantity: true,
      );

      final entity = suite.toEntity();

      expect(entity.quantity, 2);
      expect(entity.name, 'Suite Teste');
      expect(entity.photos.length, 0);
      expect(entity.items.length, 1);
      expect(entity.periods.length, 1);
      expect(entity.categoryItems.length, 1);
      expect(entity.showAvailableQuantity, true);
    });
  });
}
