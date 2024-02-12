import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //user sign out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout_rounded))],
      ),
      body: Center(
        child: Text(
            "User logged in as : " + user.email!,
            style: TextStyle(
              fontSize: 15.0,
            ),
        ),
      ),
    );
  }
}
