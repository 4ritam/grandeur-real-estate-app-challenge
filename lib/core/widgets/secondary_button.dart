import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const SecondaryButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: child,
    );
  }
}
