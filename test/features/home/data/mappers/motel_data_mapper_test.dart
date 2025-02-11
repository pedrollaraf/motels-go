import 'package:flutter_test/flutter_test.dart';
import 'package:moteis_go/features/home/data/models.dart';

void main() {
  group('MotelData', () {
    test('MotelData.fromJson should correctly convert JSON to entity', () {
      final json = {
        'pagina': 1,
        'qtdPorPagina': 10,
        'totalSuites': 5,
        'totalMoteis': 3,
        'raio': 10.0,
        'maxPaginas': 5,
        'moteis': [
          {
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
          }
        ]
      };

      final motelData = MotelData.fromJson(json);

      expect(motelData.page, 1);
      expect(motelData.itemsPerPage, 10);
      expect(motelData.totalSuites, 5);
      expect(motelData.totalMoteis, 3);
      expect(motelData.radius, 10.0);
      expect(motelData.maxPages, 5);
      expect(motelData.motels.length, 1);
    });

    test('MotelData.toEntity must correctly convert entity to entity', () {
      final motelData = MotelData(
        page: 1,
        itemsPerPage: 10,
        totalSuites: 5,
        totalMoteis: 3,
        radius: 10.0,
        maxPages: 5,
        motels: [
          Motel(
            logo: 'logo.png',
            rating: 4.5,
            neighborhood: 'Centro',
            fantasyName: 'Motel Teste',
            distance: 2.0,
            favoriteCount: 100,
            reviewCount: 50,
            suites: [],
          )
        ],
      );

      final entity = motelData.toEntity();

      expect(entity.page, 1);
      expect(entity.itemsPerPage, 10);
      expect(entity.totalSuites, 5);
      expect(entity.totalMoteis, 3);
      expect(entity.radius.doubleValue, 10.0);
      expect(entity.maxPages, 5);
      expect(entity.motels.length, 1);
    });
  });
}
