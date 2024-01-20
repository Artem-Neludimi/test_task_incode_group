import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/features/choices_result/data/choices_result_repository.dart';

part 'choices_result_event.dart';
part 'choices_result_state.dart';

class ChoicesResultBloc extends Bloc<ChoicesResultEvent, ChoicesResultState> {
  final ChoicesResultRepository _repository;
  ChoicesResultBloc(this._repository) : super(const ChoicesResultState()) {
    on<ChoicesResultEvent>(
      (event, emit) => switch (event) {
        ChoicesResultStarted() => _onStarted(emit),
      },
    );
  }

  Future<void> _onStarted(Emitter<ChoicesResultState> emit) async {
    await Future.wait([
      _listenToAllAttempts(emit),
      _listenToCharactersCount(emit),
    ]);
  }

  Future<void> _listenToAllAttempts(Emitter<ChoicesResultState> emit) async {
    await emit.onEach(_repository.watchAllAttempts(), onData: (data) {
      emit(state.copyWith(
        total: data,
      ));
    });
  }

  Future<void> _listenToCharactersCount(Emitter<ChoicesResultState> emit) async {
    await emit.onEach(_repository.watchCharacters(), onData: (data) {
      final total = state._total;
      final success = data.where((element) => element.isGuessed).length;
      final failed = total - success;

      emit(state.copyWith(
        success: success,
        failed: failed,
      ));
    });
  }
}
