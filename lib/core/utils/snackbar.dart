import 'package:flutter/material.dart';
import 'package:grandeur/core/utils/result.dart';

class Snackbar {
  static void show(BuildContext context, String message, ResultType type) {
    Color background;
    Color textColor;
    switch (type) {
      case ResultType.success:
        background = Colors.green;
        textColor = Colors.white;
        break;

      case ResultType.error:
        background = Theme.of(context).colorScheme.error;
        textColor = Theme.of(context).colorScheme.onError;
        break;

      case ResultType.info:
        background = Theme.of(context).colorScheme.primary;
        textColor = Theme.of(context).colorScheme.onPrimary;
        break;

      default:
        background = Theme.of(context).colorScheme.secondary;
        textColor = Theme.of(context).colorScheme.onSecondary;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: background,
      ),
    );
  }
}
