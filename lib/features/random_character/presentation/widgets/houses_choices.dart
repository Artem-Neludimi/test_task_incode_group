import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/core/assets/assets.gen.dart';
import 'package:test_task/core/extensions/string_extensions.dart';
import 'package:test_task/core/widgets/card_button.dart';
import 'package:test_task/features/random_character/logic/random_character/random_character_bloc.dart';

import '../../../../core/services/api/models/character_model/character_model.dart';

class HousesChoices extends StatelessWidget {
  const HousesChoices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RandomCharacterBloc>();
    final rightHouseGuess = bloc.state.isRightHouseGuess;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _HouseButton(House.gryffindor, Assets.images.gryffindor.image(), rightHouseGuess),
                _HouseButton(House.slytherin, Assets.images.slytherin.image(), rightHouseGuess),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _HouseButton(House.ravenclaw, Assets.images.ravenclaw.image(), rightHouseGuess),
                _HouseButton(House.hufflepuff, Assets.images.hufflepuff.image(), rightHouseGuess),
              ],
            ),
          ),
          Expanded(
            child: CardButton(
              onPressed: rightHouseGuess
                  ? null
                  : () {
                      context.read<RandomCharacterBloc>().add(const RandomCharacterHouseGuess(House.notInHouse));
                    },
              isRight: bloc.state.isRightHouse(House.notInHouse),
              child: Text('Not in House'.hardcoded()),
            ),
          ),
        ],
      ),
    );
  }
}

class _HouseButton extends StatelessWidget {
  const _HouseButton(this.house, this.image, this.rightHouseGuess);
  final House house;
  final Image image;
  final bool rightHouseGuess;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RandomCharacterBloc>();

    return Expanded(
      child: CardButton(
        isRight: bloc.state.isRightHouse(house),
        onPressed: rightHouseGuess
            ? null
            : () {
                bloc.add(RandomCharacterHouseGuess(house));
              },
        child: Column(
          children: [
            Text(house.name.capitalized()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
