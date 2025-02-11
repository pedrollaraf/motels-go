import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('Motel', () {
    test('Motel.fromJson should correctly convert JSON to entity', () {
      final json = {
        'logo': 'logo.png',
        'media': 4.5,
        'bairro': 'Centro',
        'fantasia': 'Motel Teste',
        'distancia': 2.0,
        'qtdFavoritos': 100,
        'qtdAvaliacoes': 50,
        'suites': [
          {'qtd': 2, 'nome': 'Suite 1', 'fotos': [], 'itens': [], 'periodos': [], 'categoriaItens': []}
        ]
      };

      final motel = Motel.fromJson(json);

      expect(motel.logo, 'logo.png');
      expect(motel.rating, 4.5);
      expect(motel.neighborhood, 'Centro');
      expect(motel.fantasyName, 'Motel Teste');
      expect(motel.distance, 2.0);
      expect(motel.favoriteCount, 100);
      expect(motel.reviewCount, 50);
      expect(motel.suites.length, 1);
    });

    test('Motel.toEntity must correctly convert entity to entity', () {
      final motel = Motel(
        logo: 'logo.png',
        rating: 4.5,
        neighborhood: 'Centro',
        fantasyName: 'Motel Teste',
        distance: 2.0,
        favoriteCount: 100,
        reviewCount: 50,
        suites: [],
      );

      final entity = motel.toEntity();

      expect(entity.logo, 'logo.png');
      expect(entity.rating.doubleValue, 4.5);
      expect(entity.neighborhood, 'Centro');
      expect(entity.fantasyName, 'Motel Teste');
      expect(entity.distance.doubleValue, 2.0);
      expect(entity.favoriteCount, 100);
      expect(entity.reviewCount, 50);
      expect(entity.suites.length, 0);
    });
  });
}
