import 'package:flutter/material.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/features/choices_result/presentation/choices_results.dart';
import 'package:test_task/features/list/logic/list_config.dart';
import 'package:test_task/features/list/presentation/widgets/list_screen_list.dart';
import 'package:test_task/features/list/presentation/widgets/list_screen_search.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key, required this.bottomNavigationBar});
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return ListConfig(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Screen'.hardcoded()),
        ),
        body: const _ListBody(),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

class _ListBody extends StatelessWidget {
  const _ListBody();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ChoicesResults(),
          SizedBox(height: 8),
          ListScreenSearch(),
          SizedBox(height: 16),
          ListScreenList(),
        ],
      ),
    );
  }
}
