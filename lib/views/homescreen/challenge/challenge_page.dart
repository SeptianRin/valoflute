import 'dart:math';

import 'package:valoflute/models/agent.dart';
import 'package:valoflute/models/weapon.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  List<Weapon> listMainWeapon = listWeapon
      .where((element) =>
          (element.category != "Sidearm") && (element.category != "Melee"))
      .toList();
  List<Weapon> listSecondaryWeapon = listWeapon
      .where((element) =>
          (element.category == "Sidearms") || (element.category == "Melee"))
      .toList();
  var _randomAgent = Random().nextInt(listAgent.length);
  var _randomMainWeapon = 0;
  var _randomSecondaryWeapon = 0;

  void randomized() {
    setState(() {
      _randomAgent = Random().nextInt(listAgent.length);
      _randomMainWeapon = Random().nextInt(listMainWeapon.length);
      _randomSecondaryWeapon = Random().nextInt(listSecondaryWeapon.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    var isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 20),
        child: isPotrait ? potraitView() : landscapeView());
  }

  Widget potraitView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Let's take the challenge for next round",
          style: TextStyle(fontSize: 25, fontFamily: "BebasNeue"),
        ),
        Image.network(
          listAgent[_randomAgent].icon,
          width: 150,
        ),
        Text(
          listAgent[_randomAgent].name,
          style: const TextStyle(fontSize: 30, fontFamily: "BebasNeue"),
        ),
        Image.network(
          listMainWeapon[_randomMainWeapon].image,
          width: 150,
        ),
        Text(
          listMainWeapon[_randomMainWeapon].name,
          style: const TextStyle(fontSize: 30, fontFamily: "BebasNeue"),
        ),
        Image.network(
          listSecondaryWeapon[_randomSecondaryWeapon].image,
          width: 150,
        ),
        Text(
          listSecondaryWeapon[_randomSecondaryWeapon].name,
          style: const TextStyle(fontSize: 30, fontFamily: "BebasNeue"),
        ),
        ElevatedButton(
            onPressed: () {
              randomized();
            },
            child: const Text("Randomize"))
      ],
    );
  }

  Widget landscapeView() {
    return Column(
      children: [
        const Text(
          "Let's take the challenge for next round",
          style: TextStyle(fontSize: 25, fontFamily: "BebasNeue"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.network(
                  listAgent[_randomAgent].icon,
                  width: 100,
                ),
                Text(
                  listAgent[_randomAgent].name,
                  style: const TextStyle(fontSize: 20, fontFamily: "BebasNeue"),
                ),
              ],
            ),
            Column(
              children: [
                Image.network(
                  listMainWeapon[_randomMainWeapon].image,
                  width: 100,
                ),
                Text(
                  listMainWeapon[_randomMainWeapon].name,
                  style: const TextStyle(fontSize: 20, fontFamily: "BebasNeue"),
                ),
              ],
            ),
            Column(
              children: [
                Image.network(
                  listSecondaryWeapon[_randomSecondaryWeapon].image,
                  width: 100,
                ),
                Text(
                  listSecondaryWeapon[_randomSecondaryWeapon].name,
                  style: const TextStyle(fontSize: 20, fontFamily: "BebasNeue"),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  randomized();
                },
                child: const Text("Randomize")),
          ],
        ),
      ],
    );
  }
}
