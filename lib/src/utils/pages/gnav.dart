import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stocks_app/src/pages/news_page.dart';
import 'package:stocks_app/src/pages/profile.dart';
import 'package:stocks_app/src/pages/stocks_page.dart';
import 'package:stocks_app/src/pages/watchlist.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

final List _pages = [
  WatchList(),
  Stocks(),
  News(),
  Profile(),
];


class _HomePage2State extends State<HomePage2> {
  int _selectedIndex = 0;

  final user = FirebaseAuth.instance.currentUser!;

  //user sign out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GNav(
              backgroundColor: Colors.black,
              tabBorder: Border.all(color: Colors.black, width: 1),
              //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)],
              color: Colors.white,
              iconSize: 24,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade700,
                haptic: true,
              padding: const EdgeInsets.all(24.0),
              duration: const Duration(milliseconds: 400),
              gap: 8,
              tabs: const [
                GButton(icon: Icons.remove_red_eye_outlined,
                text: 'Watch',),
                GButton(icon: Icons.addchart_outlined,
                text: 'Stocks',),
                GButton(icon: Icons.currency_rupee_outlined,
                text: 'News',),
                GButton(icon: Icons.person,
                text: 'Profile',),
              ],
              onTabChange: (index){
                setState(() {
                  _selectedIndex = index;
                  print(_selectedIndex);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
