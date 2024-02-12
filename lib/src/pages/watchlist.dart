import 'package:flutter/material.dart';
import 'package:stocks_app/src/common_widgets/drawer.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onProfileTap: (){},
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('W A T C H L I S T',
          style: TextStyle(
            color: Colors.grey,
          ),),
        centerTitle: true,
      ),
      body: const Center(child: Text('Watchlist Page')),
    );
  }
}
