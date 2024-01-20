import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/all_characters/logic/bloc/all_characters_bloc.dart';
import 'package:test_task/features/list/logic/bloc/list_bloc.dart';
import 'package:test_task/features/list/logic/controllers.dart';

class ListConfig extends StatefulWidget {
  const ListConfig({super.key, required this.child});
  final Widget child;

  @override
  State<ListConfig> createState() => _ListConfigState();
}

class _ListConfigState extends State<ListConfig> {
  @override
  void initState() {
    final allCharacter = (context.read<AllCharactersBloc>().state as AllCharactersLoaded).allCharacters;
    context.read<ListBloc>().add(ListStarted(allCharacter));
    context.read<ListControllers>().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
