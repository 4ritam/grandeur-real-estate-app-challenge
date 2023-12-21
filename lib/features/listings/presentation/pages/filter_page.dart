import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Declare variables for filter options
  bool option1 = false;
  bool option2 = false;
  bool option3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Page'),
      ),
      body: Column(
        children: [
          // Filter option 1
          CheckboxListTile(
            title: const Text('Option 1'),
            value: option1,
            onChanged: (value) {
              setState(() {
                option1 = !option1;
              });
            },
          ),
          // Filter option 2
          CheckboxListTile(
            title: const Text('Option 2'),
            value: option2,
            onChanged: (value) {
              setState(() {
                option2 = !option2;
              });
            },
          ),
          // Filter option 3
          CheckboxListTile(
            title: const Text('Option 3'),
            value: option3,
            onChanged: (value) {
              setState(() {
                option3 = !option3;
              });
            },
          ),
          // Apply button
          ElevatedButton(
            onPressed: () {},
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
