import 'package:flutter/material.dart';
import 'package:stocks_app/src/common_widgets/drawer.dart';
import 'package:stocks_app/src/common_widgets/square.dart';
class Stocks extends StatefulWidget {
   Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  final items = List.generate(50, (i) => (i));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onProfileTap: (){},
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('S T O C K S',
          style: TextStyle(
            color: Colors.grey,
          ),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
          itemBuilder: (context,index) {
              final item = items[index];
              return ListTile(
                title: Text('Item $item'),
                subtitle: Text('my subtitle'),
                onTap: ()=> {},
                trailing: const Icon(Icons.chevron_right_sharp),
              );
          }),
    );
  }
}
