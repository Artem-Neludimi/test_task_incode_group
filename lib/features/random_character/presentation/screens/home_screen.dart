import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/features/random_character/logic/config/random_character_config.dart';

import '../../logic/random_character/random_character_bloc.dart';
import '../../../choices_result/presentation/choices_results.dart';
import '../widgets/houses_choices.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.bottomNavigationBar,
  });
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return RandomCharacterConfig(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'.hardcoded()),
          actions: [
            IconButton(
              onPressed: () {
                context.read<RandomCharacterBloc>().add(const RandomCharacterReset());
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: const _Body(),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<RandomCharacterBloc, RandomCharacterState>(
        builder: (context, state) {
          if (state.randomCharacter == null && state.guessedAllCharacters == false) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const ChoicesResults(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        const _CharacterImage(),
                        const SizedBox(height: 6),
                        Text(state.randomCharacter?.name ?? ''),
                      ],
                    ),
                  ),
                ),
                const HousesChoices(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomCharacterBloc, RandomCharacterState>(
      builder: (context, state) {
        if (state.guessedAllCharacters) {
          return Expanded(child: Center(child: Text('You guessed all characters!'.hardcoded())));
        }
        return Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(state.randomCharacter!.image),
          ),
        );
      },
    );
  }
}
