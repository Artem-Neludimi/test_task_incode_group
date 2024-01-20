import 'package:flutter/material.dart';
import 'package:test_task/core/navigation/app_router.dart';

import 'core/di/global_di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalDI(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          //TODO: handle theme
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                onSecondary: Colors.green,
              ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
