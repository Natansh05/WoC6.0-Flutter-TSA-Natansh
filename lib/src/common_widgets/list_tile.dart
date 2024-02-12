import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String text;
  const MyListTile({
    super.key,
  required this.text,required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(icon,color: Colors.white,),
        title: Text(text,
        style: const TextStyle(
          color: Colors.white,
        ),),
        onTap: onTap,
      ),
    );
  }
}
