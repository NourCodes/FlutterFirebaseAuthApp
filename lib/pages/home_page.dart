import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/auth.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  User user = FirebaseAuth.instance.currentUser!;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "User Email:",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            user.email!,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
