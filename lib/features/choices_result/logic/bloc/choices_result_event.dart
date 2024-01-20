part of 'choices_result_bloc.dart';

@immutable
sealed class ChoicesResultEvent {
  const ChoicesResultEvent();
}

class ChoicesResultStarted extends ChoicesResultEvent {
  const ChoicesResultStarted();
}