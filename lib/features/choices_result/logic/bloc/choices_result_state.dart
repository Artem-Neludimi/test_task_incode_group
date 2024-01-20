part of 'choices_result_bloc.dart';

class ChoicesResultState {
  const ChoicesResultState({
    int total = 0,
    int success = 0,
    int failed = 0,
  })  : _failed = failed,
        _success = success,
        _total = total;

  final int _total;
  final int _success;
  final int _failed;

  String get total => _total.toString();
  String get success => _success.toString();
  String get failed => _failed.toString();

  ChoicesResultState copyWith({
    int? total,
    int? success,
    int? failed,
  }) {
    return ChoicesResultState(
      total: total ?? _total,
      success: success ?? _success,
      failed: failed ?? _failed,
    );
  }
}
