import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  const SearchField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              autofocus: false,
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
