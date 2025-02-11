import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/core/data/network/service/api_service.dart';
import 'package:moteis_go/features/home/data/datasource/remote/motels_remote_datasource_impl.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moteis_go/features/home/data/models/motel_data.dart';

class MockApiService extends Mock implements ApiService {}

class MockLogger extends Mock implements Logger {}

class MockResponse extends Mock implements http.Response {}

void main() {
  final getIt = GetIt.instance;
  late MockApiService mockApiService;
  late MockLogger mockLogger;
  late MotelsRemoteDataSourceImpl dataSource;

  setUp(() {
    getIt.registerSingleton<MockApiService>(MockApiService());
    getIt.registerSingleton<MockLogger>(MockLogger());
    mockApiService = getIt<MockApiService>();
    mockLogger = getIt<MockLogger>();
    dataSource = MotelsRemoteDataSourceImpl(mockApiService, mockLogger);
  });

  tearDown(() {
    getIt.reset();
  });

  test('should return MotelData when the call to remote data source is successful', () async {
    // Arrange
    final jsonResponse = {
      "data": {
        "pagina": 1,
        "qtdPorPagina": 10,
        "totalSuites": 0,
        "totalMoteis": 1,
        "raio": 0,
        "maxPaginas": 1,
        "moteis": [],
      }
    };
    final mockResponse = MockResponse();

    when(() => mockResponse.body).thenReturn(jsonEncode(jsonResponse));
    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockApiService.get(any())).thenAnswer((_) async => mockResponse);

    // Act
    final result = await dataSource.getMotelsFromRemote();

    // Assert
    expect(result, isA<Right<Failure, MotelData>>());
    verify(() => mockApiService.get(any())).called(1);
    verify(() => mockLogger.d(any())).called(1);
  });

  test('should return Failure when the call to remote data source fails', () async {
    // Arrange
    when(() => mockApiService.get(any())).thenThrow(Exception("Network Error"));

    // Act
    final result = await dataSource.getMotelsFromRemote();

    // Assert
    expect(result, isA<Left<Failure, MotelData>>());
    verify(() => mockApiService.get(any())).called(1);
    verifyNever(() => mockLogger.d(any()));
  });
}
