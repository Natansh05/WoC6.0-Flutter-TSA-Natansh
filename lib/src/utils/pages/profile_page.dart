import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page',
          style: TextStyle(
            color: Colors.black,
          ),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.remove_red_eye),
            label: 'Watchlist'),
            BottomNavigationBarItem(icon: Icon(Icons.addchart_outlined),
            label: 'Stocks'),
            BottomNavigationBarItem(icon: Icon(Icons.currency_rupee_outlined),
            label: 'News'),
            BottomNavigationBarItem(icon: Icon(Icons.account_box),
            label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
