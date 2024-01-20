import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/services/api/models/character_model/character_model.dart';
import '../../../all_characters/data/all_characters_repository.dart';

part 'all_characters_event.dart';
part 'all_characters_state.dart';

class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {
  final AllCharactersRepository _repository;

  AllCharactersBloc(this._repository) : super(const AllCharactersInitial()) {
    on<AllCharactersEvent>(
      (event, emit) => switch (event) {
        AllCharactersStarted() => _onStarted(emit),
      },
    );
  }

  Future<void> _onStarted(Emitter<AllCharactersState> emit) async {
    try {
      final allCharacters = await _repository.getAllCharacters();
      final allCharactersWithImage = allCharacters.where((element) => element.image.isNotEmpty).toList();
      emit(AllCharactersLoaded(allCharactersWithImage));
    } catch (e, s) {
      developer.log('$_repository', name: 'AllCharactersBloc', error: e, stackTrace: s);
      emit(AllCharactersError(e.toString()));
    }
  }
}
