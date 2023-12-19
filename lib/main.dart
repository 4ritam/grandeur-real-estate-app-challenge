import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/routes/routes.dart';
import 'config/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool done = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grandeur',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: done ? Routes.authRoutes : Routes.defaultRoutes,
    );
  }
}
