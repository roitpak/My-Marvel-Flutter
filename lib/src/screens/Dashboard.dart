import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_application/auth.dart';
import 'package:my_first_flutter_application/src/objects/menuObject.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: List.generate(
          menus.length,
          (index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {}
                if (index == 1) {
                  Navigator.pushNamed(context, '/comicsScreen');
                }
              },
              child: Center(
                child: Card(
                    color: Colors.grey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            menus[index].icon,
                            size: 50,
                          ),
                          Text(menus[index].title),
                        ],
                      ),
                    )),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          signOut(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout),
      ),
    );
  }
}

List<MenuObject> menus = const <MenuObject>[
  MenuObject(title: "Characters", icon: Icons.person_search),
  MenuObject(title: "Comics", icon: Icons.auto_stories)
];
