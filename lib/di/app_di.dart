import 'package:get_it/get_it.dart';
import 'package:moteis_go/core/di/core_di.dart';
import 'package:moteis_go/features/home/di/home_di.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  registerHomeDependencies();
  registerCoreDependencies();
}
