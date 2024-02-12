import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stocks_app/src/utils/pages/gnav.dart';
import 'package:stocks_app/src/utils/pages/login_page.dart';
import 'package:stocks_app/src/utils/pages/profile_page.dart';

import 'home_page.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //user is logged in
          if(snapshot.hasData) {
            return HomePage2();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
