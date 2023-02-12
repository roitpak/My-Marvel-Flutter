import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/auth.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_flutter_application/src/objects/comics.dart';
import 'package:crypto/crypto.dart';

const publicKey = "005fb5d5b1aeedf36ef9bdda5fc613dd";
const privKey = "afb2b7a2eb233030c5c5fab0540d916d1322bea1";
var ts = DateTime.now().millisecondsSinceEpoch.toString();

String hash = md5.convert(utf8.encode(ts + privKey + publicKey)).toString();

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<Dashboard> {
  late Future<Comics> comics;

  @override
  void initState() {
    super.initState();
    comics = getComics();
  }

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pop(context);
      }
    });
  }

  Future<Comics> getComics() async {
    var url =
        'http://gateway.marvel.com/v1/public/comics?apikey=$publicKey&ts=$ts&hash=$hash';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Comics.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                signOut(context);
                // Navigator.pop(context);
              },
              child: const Text('Logout'),
            ),
            FutureBuilder<Comics>(
              future: comics,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("I HAVE DATA");
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )
          ],
        ));
  }
}
