import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Error(
        error: error,
      ),
    );
  }
}
