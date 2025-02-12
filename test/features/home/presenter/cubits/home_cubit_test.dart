import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moteis_go/core/data/network/errors/failure.dart';
import 'package:moteis_go/core/data/network/models/decimal.dart';
import 'package:moteis_go/features/home/domain/entities/motel_data_entity.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';

class MockGetMotelsUsecases extends Mock implements GetMotelsUsecases {}

void main() {
  late HomeCubit homeCubit;
  late MockGetMotelsUsecases mockUsecases;

  setUp(() {
    mockUsecases = MockGetMotelsUsecases();
    homeCubit = HomeCubit(usecases: mockUsecases);
  });

  tearDown(() {
    homeCubit.close();
  });

  group('getMotels', () {
    final motelData = MotelDataEntity(
      page: 0,
      itemsPerPage: 0,
      totalMoteis: 1,
      totalSuites: 1,
      radius: Decimal(
        formattedValue: "0.0",
        doubleValue: 0.0,
      ),
      maxPages: Decimal(
        formattedValue: "1.0",
        doubleValue: 1.0,
      ),
      motels: [],
    );

    blocTest<HomeCubit, HomeState>(
      'should emit [MotelsLoadingState, MotelsSuccessState] when the request is successful',
      build: () {
        when(() => mockUsecases.invoke()).thenAnswer((_) async => Right(motelData));
        return homeCubit;
      },
      act: (cubit) => cubit.getMotels(),
      expect: () => [
        const HomeState(motelsRequestState: MotelsLoadingState()),
        HomeState(motelDataEntity: motelData, motelsRequestState: MotelsSuccessState()),
      ],
      verify: (_) {
        verify(() => mockUsecases.invoke()).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'should emit [MotelsFailureState] and maintain state on failure',
      build: () {
        when(() => mockUsecases.invoke()).thenAnswer((_) async => Left(ServerErrorException("Erro no servidor")));
        return homeCubit;
      },
      act: (cubit) => cubit.getMotels(),
      expect: () => [
        const HomeState(motelsRequestState: MotelsLoadingState()),
        HomeState(motelsRequestState: MotelsFailureState()),
      ],
      verify: (_) {
        verify(() => mockUsecases.invoke()).called(1);
      },
    );
  });
}
