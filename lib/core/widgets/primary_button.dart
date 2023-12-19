import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const PrimaryButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: child,
    );
  }
}
