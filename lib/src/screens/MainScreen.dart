import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/src/screens/ComicsScreen.dart';
import 'package:my_first_flutter_application/src/screens/Dashboard.dart';
import 'package:my_first_flutter_application/src/screens/LoginScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      title: "My App!",
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const Dashboard(),
        '/comicsScreen': (context) => const ComicsScreen(),
      },
    );
  }
}
