import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/auth.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signOut(context);
            // Navigator.pop(context);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
