import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';
import 'package:moteis_go/features/home/domain/repositories/motels_repository.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases_impl.dart';

class MockMotelsRepository extends Mock implements MotelsRepository {}

void main() {
  late GetMotelsUsecasesImpl usecase;
  late MockMotelsRepository mockRepository;

  setUp(() {
    mockRepository = MockMotelsRepository();
    usecase = GetMotelsUsecasesImpl(mockRepository);
  });

  group('invoke', () {
    test('should return MotelDataEntity when the repository call is successful', () async {
      // Arrange
      final motelData = MotelDataEntity(
        page: 0,
        itemsPerPage: 0,
        totalMoteis: 1,
        totalSuites: 1,
        radius: Decimal(
          formattedValue: "0.0",
          doubleValue: 0.0,
        ),
        maxPages: 1,
        motels: [],
      );
      when(() => mockRepository.getMotels()).thenAnswer((_) async => Right(motelData));

      // Act
      final result = await usecase.invoke();

      // Assert
      expect(result, isA<Right<Failure, MotelDataEntity>>());
      verify(() => mockRepository.getMotels()).called(1);
    });

    test('should return Failure when the repository call fails', () async {
      // Arrange
      final failure = ServerErrorException("Server error");
      when(() => mockRepository.getMotels()).thenAnswer((_) async => Left(failure));

      // Act
      final result = await usecase.invoke();

      // Assert
      expect(result, isA<Left<Failure, MotelDataEntity>>());
      verify(() => mockRepository.getMotels()).called(1);
    });
  });
}
