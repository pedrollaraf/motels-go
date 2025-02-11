import 'package:logger/logger.dart';
import 'package:moteis_go/core/data/network/service/api_service.dart';
import 'package:moteis_go/di/app_di.dart';
import 'package:moteis_go/features/home/data/datasource/remote/motels_remote_datasource.dart';
import 'package:moteis_go/features/home/data/datasource/remote/motels_remote_datasource_impl.dart';
import 'package:moteis_go/features/home/data/repositories/motels_repository_impl.dart';
import 'package:moteis_go/features/home/domain/repositories/motels_repository.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases_impl.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';

void registerHomeDependencies() {
  getIt.registerFactory<MotelsRemoteDataSource>(
    () => MotelsRemoteDataSourceImpl(
      getIt<ApiService>(),
      getIt<Logger>(),
    ),
  );

  getIt.registerFactory<MotelsRepository>(
    () => MotelsRepositoryImpl(
      getIt<MotelsRemoteDataSource>(),
    ),
  );

  getIt.registerFactory<GetMotelsUsecases>(
    () => GetMotelsUsecasesImpl(
      getIt<MotelsRepository>(),
    ),
  );

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      usecases: getIt<GetMotelsUsecases>(),
    ),
  );
}
