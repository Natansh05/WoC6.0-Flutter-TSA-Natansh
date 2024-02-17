import 'package:flutter/material.dart';
import 'package:stocks_app/services/stockApi_services.dart';
import 'package:stocks_app/src/common_widgets/drawer.dart';
import 'package:stocks_app/src/common_widgets/square.dart';

class Stocks extends StatefulWidget {
  Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  final items = List.generate(50, (i) => (i));

  StocksApi stock = StocksApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onProfileTap: () {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'S T O C K S',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: stock.getStock(),

        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return const Center(
              child: Text('Data available!'),
            );
          } else {
            return const Center(
              child: Text('snapshot me data nai hai'),
            );
          }
        },
      ),
    );
  }
}
