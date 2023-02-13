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
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.data!.results!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = snapshot.data!.data!.results![index];
                          return SizedBox(
                            height: 50,
                            child: Column(
                              children: [
                                Image.network(
                                  "${item.thumbnail!.path}.${item.thumbnail!.extension}",
                                  height: 30,
                                ),
                                Center(child: Text('Entry ${item.title}'))
                              ],
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ));
  }
}
