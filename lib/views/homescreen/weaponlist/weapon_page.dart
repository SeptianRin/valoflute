import 'package:flutter/material.dart';

import '../../../models/weapon.dart';

class WeaponPage extends StatelessWidget {
  const WeaponPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPotrait =  MediaQuery.of(context).orientation == Orientation.portrait;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPotrait ? 2 : 4),
        itemCount: listWeapon.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white12,
            elevation: 4.0,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    listWeapon[index].image,
                    fit: BoxFit.fitWidth,
                  ),
                  Text(listWeapon[index].name)
                ],
              ),
            ),
          );
        });
  }
}
