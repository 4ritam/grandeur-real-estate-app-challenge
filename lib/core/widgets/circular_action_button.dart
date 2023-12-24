import 'package:flutter/material.dart';

class CircularActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CircularActionButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        side: BorderSide(color: Theme.of(context).colorScheme.onBackground),
      ),
      child: child,
    );
  }
}
