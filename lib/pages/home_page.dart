import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/LoginScreen'); // Make sure this route exists
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          )
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, ${user.email}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
