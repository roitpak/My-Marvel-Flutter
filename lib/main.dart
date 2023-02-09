import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/src/screens/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDX7b5syoO6huWDsIrfZn_wdVouQ7QCk88",
          appId: "1:709940144057:web:7bc1dd41fce003ab7f7868",
          messagingSenderId: "709940144057",
          projectId: "texas-4e94f"));
  runApp(const MainScreen());
}
