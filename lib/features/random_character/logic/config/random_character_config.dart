import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../all_characters/logic/bloc/all_characters_bloc.dart';
import '../random_character/random_character_bloc.dart';

class RandomCharacterConfig extends StatefulWidget {
  const RandomCharacterConfig({super.key, required this.child});
  final Widget child;

  @override
  State<RandomCharacterConfig> createState() => _RandomCharacterConfigState();
}

class _RandomCharacterConfigState extends State<RandomCharacterConfig> {
  @override
  void initState() {
    context.read<AllCharactersBloc>().add(const AllCharactersStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AllCharactersBloc, AllCharactersState>(
          listenWhen: (previous, current) => current is AllCharactersLoaded,
          listener: (context, state) {
            final allCharacters = (state as AllCharactersLoaded).allCharacters;
            context.read<RandomCharacterBloc>().add(RandomCharacterStarted(allCharacters));
          },
        ),
        BlocListener<AllCharactersBloc, AllCharactersState>(
          listenWhen: (previous, current) => current is AllCharactersError,
          listener: (context, state) {
            // TODO: handle error
          },
        ),
      ],
      child: widget.child,
    );
  }
}
