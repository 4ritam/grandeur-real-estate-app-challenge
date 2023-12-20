import 'package:flutter/material.dart';
import 'package:grandeur/core/widgets/circular_action_button.dart';
import 'package:go_router/go_router.dart';

class BackCircularButton extends StatelessWidget {
  const BackCircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularActionButton(
      child: const Icon(Icons.arrow_back),
      onPressed: () {
        context.pop();
      },
    );
  }
}
