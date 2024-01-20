import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/list_bloc.dart';

class ListControllers {
  late BuildContext screenContext;

  final searchController = TextEditingController();

  void init(BuildContext context) {
    screenContext = context;
  }

  void onChanged(String value) {
    screenContext.read<ListBloc>().add(ListFindCharacter(value));
  }

  void dispose() {
    searchController.dispose();
  }
}
