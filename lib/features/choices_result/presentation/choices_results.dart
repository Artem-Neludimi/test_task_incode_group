import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/choices_result/logic/bloc/choices_result_bloc.dart';

import '../../../core/di/presentation_di.dart';

class ChoicesResults extends StatelessWidget {
  const ChoicesResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ChoicesResultsDI(child: _Results());
  }
}

class _Results extends StatefulWidget {
  const _Results();

  @override
  State<_Results> createState() => _ResultsState();
}

class _ResultsState extends State<_Results> {
  @override
  void initState() {
    context.read<ChoicesResultBloc>().add(const ChoicesResultStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChoicesResultBloc, ChoicesResultState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Total'),
                      Text(state.total),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Success'),
                      Text(state.success),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Failed'),
                      Text(state.failed),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
