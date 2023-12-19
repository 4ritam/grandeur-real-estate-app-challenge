import 'package:flutter/material.dart';
import 'package:grandeur/features/authentication/presentation/pages/get_started_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> defaultRoutes = {
    '/': (context) => Container(),
  };

  static Map<String, Widget Function(BuildContext)> authRoutes = {
    '/': (context) => const GetStartedPage(),
  };
}
