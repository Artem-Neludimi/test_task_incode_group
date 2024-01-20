import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task/features/list/data/list_repository.dart';
import 'package:test_task/features/list/logic/controllers.dart';

import '../../features/choices_result/data/choices_result_repository.dart';
import '../../features/choices_result/logic/bloc/choices_result_bloc.dart';
import '../../features/list/logic/bloc/list_bloc.dart';

class ListScreenDI extends StatelessWidget {
  const ListScreenDI({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListBloc(
            context.read<ListRepository>(),
          ),
        ),
        Provider(
          create: (context) => ListControllers(),
          dispose: (context, value) => value.dispose(),
        ),
      ],
      child: child,
    );
  }
}

class ChoicesResultsDI extends StatelessWidget {
  const ChoicesResultsDI({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChoicesResultBloc(
        context.read<ChoicesResultRepository>(),
      ),
      child: child,
    );
  }
}
