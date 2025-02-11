import 'package:logger/logger.dart';
import 'package:moteis_go/core/data/network/service/api_service.dart';
import 'package:moteis_go/di/app_di.dart';

Future<void> registerCoreDependencies() async {
  getIt.registerSingleton<Logger>(Logger());
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<Logger>()),
  );
}
