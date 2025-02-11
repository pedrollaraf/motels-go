import 'package:flutter/material.dart';
import 'package:moteis_go/common/theme/app_color_theme.dart';
import 'package:moteis_go/features/home/presenter/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: AppColorTheme.primaryColor,
        ),
        scaffoldBackgroundColor: AppColorTheme.backgroundColor,
      ),
      home: DefaultTabController(
        length: 2,
        child: const HomePage(),
      ),
    );
  }
}
