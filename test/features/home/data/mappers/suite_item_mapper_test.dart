import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('SuiteItem', () {
    test('SuiteItem.fromJson should correctly convert JSON to entity', () {
      final json = {'nome': 'Item Suite Teste'};

      final suiteItem = SuiteItem.fromJson(json);

      expect(suiteItem.name, 'Item Suite Teste');
    });

    test('SuiteItem.toEntity must correctly convert entity to entity', () {
      final suiteItem = SuiteItem(name: 'Item Suite Teste');
      final entity = suiteItem.toEntity();

      expect(entity.name, 'Item Suite Teste');
    });
  });
}
