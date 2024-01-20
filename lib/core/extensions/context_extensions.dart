import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        backgroundColor: colorScheme.primaryContainer,
        content: Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: colorScheme.error,
              ),
              const SizedBox(width: 8),
              Text(message, style: textTheme.bodyLarge!.copyWith(color: colorScheme.error)),
            ],
          ),
        ),
      ),
    );
  }
}
