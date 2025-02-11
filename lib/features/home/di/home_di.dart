import 'package:logger/logger.dart';
import 'package:moteis_go/core/data/network/service/api_service.dart';
import 'package:moteis_go/di/app_di.dart';
import 'package:moteis_go/features/home/data/repositories/get_motels_repository_impl.dart';
import 'package:moteis_go/features/home/domain/repositories/get_motels_repository.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases.dart';
import 'package:moteis_go/features/home/domain/usecases/get_motels_usecases_impl.dart';
import 'package:moteis_go/features/home/presenter/cubits/home_cubit.dart';

void registerHomeDependencies() {
  getIt.registerFactory<GetMotelsRepository>(
    () => GetMotelsRepositoryImpl(
      getIt<ApiService>(),
      getIt<Logger>(),
    ),
  );

  getIt.registerFactory<GetMotelsUsecases>(
    () => GetMotelsUsecasesImpl(
      getIt<GetMotelsRepository>(),
    ),
  );

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      usecases: getIt<GetMotelsUsecases>(),
    ),
  );
}
