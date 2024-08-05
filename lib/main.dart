
import 'package:flutter/material.dart';

import 'common/di/getIt.dart';
import 'common/theme/theme.dart';
import 'navigation/app_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _appRouter = AppNavigation();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}

