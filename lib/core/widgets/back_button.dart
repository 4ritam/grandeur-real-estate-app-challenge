import 'package:flutter/material.dart';
import 'package:grandeur/core/widgets/circular_action_button.dart';
import 'package:go_router/go_router.dart';

class BackCircularButton extends StatelessWidget {
  const BackCircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: CircularActionButton(
          child: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(Icons.arrow_back_ios, size: 32),
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
