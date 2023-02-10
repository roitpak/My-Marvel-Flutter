import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var email = "";
  var password = "";
  var emailError = "";
  var passwordError = "";
  var loading = false;

  final User? user = Auth().currentUser;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // setState(() {
      //   errorMessage = e.message;
      // });
    }
  }

  void checkLogin() async {
    if (validate()) {
      setState(() {
        loading = true;
      });
      try {
        await Auth().signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          loading = false;
        });
        print(e.message);
        setState(() {
          emailError = e.message!;
        });
      }
      setState(() {
        loading = false;
      });
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          Navigator.pushNamed(context, '/dashboard');
          print('User is signed in!');
        }
      });
    }
  }

  bool validate() {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      setState(() {
        emailError = "Email is not a valid email";
      });
      return false;
    }
    if (password.length < 8) {
      setState(() {
        passwordError = "Password must be at least 8 characters";
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Image(image: AssetImage('assets/texas.png')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                onChanged: (value) => {
                  setState(() {
                    emailError = "";
                    email = value;
                  })
                },
                decoration: InputDecoration(
                    errorText: emailError == "" ? null : emailError,
                    labelText: "Email",
                    hintText: "email@email.com",
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextField(
                onChanged: (value) => {
                  setState(() {
                    password = value;
                    passwordError = "";
                  })
                },
                obscureText: true,
                decoration: InputDecoration(
                    errorText: passwordError == "" ? null : passwordError,
                    labelText: "Password",
                    hintText: "*********",
                    border: const OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  checkLogin();
                },
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text("Login"))
          ],
        ));
  }
}
