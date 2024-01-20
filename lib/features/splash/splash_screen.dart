import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/services/db/database_service.dart';

import '../../core/navigation/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<DatabaseService>().init(),
    ]).then((_) {
      AppRoute.home.go(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
