import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:moteis_go/features/home/data/datasource/remote/motels_remote_datasource.dart';
import 'package:moteis_go/features/home/data/models/motel_data.dart';
import 'package:moteis_go/features/home/data/repositories/motels_repository_impl.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';

class MockMotelsRemoteDataSource extends Mock implements MotelsRemoteDataSource {}

void main() {
  final getIt = GetIt.instance;
  late MotelsRepositoryImpl repository;
  late MockMotelsRemoteDataSource mockDataSource;

  setUp(() {
    final mock = MockMotelsRemoteDataSource();
    getIt.registerSingleton<MotelsRemoteDataSource>(mock);

    mockDataSource = getIt<MotelsRemoteDataSource>() as MockMotelsRemoteDataSource;
    repository = MotelsRepositoryImpl(mockDataSource);
  });

  tearDown(() {
    getIt.reset();
  });

  group('getMotels', () {
    test('should return a MotelDataEntity when the call is successful', () async {
      // Arrange
      final motelData = MotelData(
        page: 0,
        itemsPerPage: 0,
        totalMoteis: 1,
        totalSuites: 1,
        radius: 0,
        maxPages: 1,
        motels: [],
      );
      when(() => mockDataSource.getMotelsFromRemote()).thenAnswer((_) async => Right(motelData));

      // Act
      final result = await repository.getMotels();

      // Assert
      expect(result, isA<Right<Failure, MotelDataEntity>>());
      verify(() => mockDataSource.getMotelsFromRemote()).called(1);
    });

    test('should return a Failure when the call fails', () async {
      // Arrange
      when(() => mockDataSource.getMotelsFromRemote()).thenAnswer(
        (_) async => Left(
          ServerErrorException("Erro no servidor"),
        ),
      );

      // Act
      final result = await repository.getMotels();

      // Assert
      expect(result, isA<Left<Failure, MotelDataEntity>>());
      verify(() => mockDataSource.getMotelsFromRemote()).called(1);
    });
  });
}
