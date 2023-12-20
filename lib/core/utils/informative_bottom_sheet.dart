import 'package:flutter/material.dart';

void showInformativeBottomSheet({
  required BuildContext context,
  required String title,
  required List<String> information,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    context: context,
    builder: (context) => InformativeBottomSheet(
      title: title,
      information: information,
    ),
  );
}

class InformativeBottomSheet extends StatelessWidget {
  final String title;
  final List<String> information;

  const InformativeBottomSheet(
      {super.key, required this.title, required this.information});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: information
                    .map((info) => Padding(
                          padding: const EdgeInsets.all(16),
                          child: ListTile(
                            title: Text(info),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
