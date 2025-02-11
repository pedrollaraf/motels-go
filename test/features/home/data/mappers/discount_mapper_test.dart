import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('Discount', () {
    test('Discount.fromJson should correctly convert JSON to entity', () {
      final json = {'desconto': 10.0};

      final discount = Discount.fromJson(json);

      expect(discount.discountAmount, 10.0);
    });

    test('Discount.toEntity must correctly convert entity to entity', () {
      final discount = Discount(discountAmount: 10.0);
      final entity = discount.toEntity();

      expect(entity.discountAmount.doubleValue, 10.0);
    });
  });
}
