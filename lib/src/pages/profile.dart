import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/src/common_widgets/drawer.dart';
 class Profile extends StatefulWidget {
   const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;

  //user sign out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       drawer: MyDrawer(
         onProfileTap: (){},
       ),
       appBar: AppBar(
         backgroundColor: Colors.black,
         elevation: 0,
         title: const Text('P R O F I L E',
           style: TextStyle(
             color: Colors.grey,
           ),),
         centerTitle: true,
       ),
       body: const Center(child: Text('Profile Page')),
     );
   }
}
