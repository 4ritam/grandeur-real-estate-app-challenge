import 'package:flutter/material.dart';

class BoxedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  const BoxedTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        autofocus: false,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
