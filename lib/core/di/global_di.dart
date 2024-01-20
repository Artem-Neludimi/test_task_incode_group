import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task/core/services/db/database_service.dart';
import 'package:test_task/features/random_character/data/random_characters_repository.dart';

import '../../features/all_characters/logic/bloc/all_characters_bloc.dart';
import '../../features/choices_result/data/choices_result_repository.dart';
import '../../features/all_characters/data/all_characters_repository.dart';
import '../../features/list/data/list_repository.dart';
import '../../features/random_character/logic/random_character/random_character_bloc.dart';
import '../services/api/api_service.dart';

class GlobalDI extends StatelessWidget {
  const GlobalDI({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return _ServiceDI(
      child: _RepositoryDI(
        child: _BlocDI(
          child: child,
        ),
      ),
    );
  }
}

class _ServiceDI extends StatelessWidget {
  const _ServiceDI({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiServiceImpl(),
        ),
        Provider<DatabaseService>(
          create: (_) => DatabaseServiceImpl(),
        ),
      ],
      child: child,
    );
  }
}

class _RepositoryDI extends StatelessWidget {
  const _RepositoryDI({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AllCharactersRepository>(
          create: (_) => AllCharactersRepositoryImpl(
            context.read<ApiService>(),
          ),
        ),
        Provider<RandomCharacterRepository>(
          create: (_) => RandomCharacterRepositoryImpl(
            context.read<DatabaseService>(),
          ),
        ),
        Provider<ChoicesResultRepository>(
          create: (_) => ChoicesResultRepositoryImpl(
            context.read<DatabaseService>(),
          ),
        ),
        Provider<ListRepository>(
          create: (_) => ListRepositoryImpl(
            context.read<DatabaseService>(),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _BlocDI extends StatelessWidget {
  const _BlocDI({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllCharactersBloc(context.read<AllCharactersRepository>()),
        ),
        BlocProvider(
          create: (context) => RandomCharacterBloc(context.read<RandomCharacterRepository>()),
        ),
      ],
      child: child,
    );
  }
}
