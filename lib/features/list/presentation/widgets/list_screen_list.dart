import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/extensions/context_extensions.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/core/navigation/app_router.dart';

import '../../domain/list_character.dart';
import '../../logic/bloc/list_bloc.dart';

class ListScreenList extends StatelessWidget {
  const ListScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ListBloc, List<CharacterListData>>(
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                key: ValueKey(state[index].id),
                onTap: () {
                  AppRoute.info.push(context, extra: state[index]);
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(state[index].image, fit: BoxFit.cover),
                  ),
                ),
                title: Text(state[index].name),
                subtitle: Text('${'Attempts'.hardcoded()} ${state[index].attempts}'),
                trailing: Icon(
                  state[index].isGuessed ? Icons.check : Icons.close,
                  color: state[index].isGuessed ? context.colorScheme.onSecondary : context.colorScheme.onError,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
