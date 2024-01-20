import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/features/list/logic/controllers.dart';

class ListScreenSearch extends StatelessWidget {
  const ListScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<ListControllers>().searchController,
      onChanged: context.read<ListControllers>().onChanged,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: 'Find character'.hardcoded(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
