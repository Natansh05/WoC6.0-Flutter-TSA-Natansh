import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stocks_app/src/utils/pages/auth_page.dart';
import 'package:stocks_app/src/utils/pages/gnav.dart';
import 'package:stocks_app/src/utils/pages/home_page.dart';
import 'package:stocks_app/src/utils/pages/login_or_register.dart';
import 'firebase_options.dart';
import 'src/utils/pages/auth_page.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primaryColor: Colors.grey[400],
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

