import 'package:valoflute/models/agent.dart';
import 'package:flutter/material.dart';

class FullPotraitCard extends StatelessWidget {
  const FullPotraitCard({super.key, required this.data});
  final Agent data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
          bottom: 10
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)
        ),
      ),
      color: Colors.red,

      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(data.background),
              fit: BoxFit.fitHeight),
        ),
        child: Image.network(data.fullPotrait),
      ),
    );
  }
}
