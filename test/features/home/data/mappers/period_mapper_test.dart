import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('Period', () {
    test('Period.fromJson should correctly convert JSON to entity', () {
      final json = {
        'tempo': '1 hora',
        'valor': 50.0,
        'desconto': {'desconto': 10.0},
        'valorTotal': 45.0,
        'temCortesia': true,
        'tempoFormatado': '1h'
      };

      final period = Period.fromJson(json);

      expect(period.duration, '1 hora');
      expect(period.price, 50.0);
      expect(period.discount?.discountAmount, 10.0);
      expect(period.totalPrice, 45.0);
      expect(period.hasCourtesy, true);
      expect(period.formattedDuration, '1h');
    });

    test('Period.toEntity must correctly convert entity to entity', () {
      final period = Period(
        duration: '1 hora',
        price: 50.0,
        discount: Discount(discountAmount: 10.0),
        totalPrice: 45.0,
        hasCourtesy: true,
        formattedDuration: '1h',
      );

      final entity = period.toEntity();

      expect(entity.duration, '1 hora');
      expect(entity.price.doubleValue, 50.0);
      expect(entity.discount?.discountAmount.doubleValue, 10.0);
      expect(entity.totalPrice.doubleValue, 45.0);
      expect(entity.hasCourtesy, true);
      expect(entity.formattedDuration, '1h');
    });
  });
}
