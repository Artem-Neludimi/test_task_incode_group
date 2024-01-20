import 'package:flutter/material.dart';
import 'package:test_task/core/extensions/context_extensions.dart';

class CardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isRight;
  final Widget? child;

  const CardButton({
    super.key,
    this.onPressed,
    this.isRight = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isRight == null
          ? null
          : isRight!
              ? context.colorScheme.onSecondary
              : context.colorScheme.onError,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
