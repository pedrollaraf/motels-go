import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moteis_go/app_widget.dart';
import 'package:moteis_go/di/app_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      AppWidget(),
    ),
  );
}
