import 'package:flutter/material.dart';
import 'package:test_task/core/extensions/string_extensions.dart';

import '../../core/navigation/app_router.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final path = AppRoute.getCurrentRoute(context);
    return BottomNavigationBar(
      currentIndex: switch (path) {
        AppRoute.home => 0,
        AppRoute.list => 1,
        _ => 0,
      },
      onTap: (index) {
        if (index == 0) AppRoute.home.go(context);
        if (index == 1) AppRoute.list.go(context);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Home'.hardcoded(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.list),
          label: 'List'.hardcoded(),
        ),
      ],
    );
  }
}
