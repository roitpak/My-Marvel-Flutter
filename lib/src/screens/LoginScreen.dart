import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  var username = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                onChanged: (value) => {
                  setState(() {
                    username = value;
                  })
                },
                decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "user123",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextField(
                onChanged: (value) => {
                  setState(() {
                    password = value;
                  })
                },
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "*********",
                    border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print("Hello world" + username + password);
                },
                child: const Text("Login"))
          ],
        ));
  }
}
