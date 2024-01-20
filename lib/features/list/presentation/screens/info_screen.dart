import 'package:flutter/material.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/features/list/domain/list_character.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.character});

  final CharacterListData character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Center(child: Image.network(character.image)),
              ),
              const SizedBox(height: 16),
              if (character.isGuessed) ...[
                Text('${'Attempts'.hardcoded()}: ${character.attempts}'),
                const SizedBox(height: 16),
                Text('${'House'.hardcoded()}: ${character.house}'),
                const SizedBox(height: 16),
                Text('${'Actor'.hardcoded()}: ${character.actor}'),
                const SizedBox(height: 16),
                Text('${'Species'.hardcoded()}: ${character.species}'),
                const SizedBox(height: 16),
                Text('${'Date of birth'.hardcoded()}: ${character.dateOfBirth}'),
              ] else ...[
                Text('Not guessed'.hardcoded(), style: Theme.of(context).textTheme.headlineMedium),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
