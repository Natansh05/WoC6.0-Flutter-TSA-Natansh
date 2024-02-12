import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/src/common_widgets/list_tile.dart';

class MyDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  //user sign out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }
  final void Function()? onProfileTap;
  MyDrawer({
    super.key,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          //header
           const DrawerHeader(
            child: Icon(
                Icons.person,
                color: Colors.white,
                size: 64,
            ),
          ),

          //home list tile
          MyListTile(text: 'H O M E', icon: Icons.home,
            onTap: ()=> Navigator.pop(context),),

          // profile list tile
          MyListTile(text: 'P O R T F O L I O', icon: Icons.pie_chart_rounded,
          onTap: onProfileTap,),

          //logout list tile
          MyListTile(text: 'L O G O U T', icon: Icons.logout_sharp,
          onTap: signUserOut,),
        ],
      ),
    );
  }
}
