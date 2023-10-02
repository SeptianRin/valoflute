import 'package:valoflute/views/homescreen/agentlist/agent_page.dart';
import 'package:valoflute/views/homescreen/challenge/challenge_page.dart';
import 'package:flutter/material.dart';

import 'weaponlist/weapon_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.title});

  final String title;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            widget.title,
            style: const TextStyle(fontFamily: "Valofont", color: Colors.red),
          )),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.resolveWith((states) =>
                  states.contains(MaterialState.selected)
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(color: Colors.white24))),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            indicatorColor: Colors.redAccent,
            backgroundColor: Colors.black,
            selectedIndex: _currentPageIndex,
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                  ),
                  icon: Icon(Icons.supervised_user_circle_outlined,
                      color: Colors.white24),
                  label: "Agents"),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings, color: Colors.white),
                icon: Icon(Icons.settings_outlined, color: Colors.white24),
                label: "Weapons",
              ),
              NavigationDestination(
                  selectedIcon:
                      Icon(Icons.two_wheeler_outlined, color: Colors.white),
                  icon: Icon(Icons.two_wheeler_sharp, color: Colors.white24),
                  label: "Challenge"),
            ],
          ),
        ),
        body: <Widget>[
          const AgentPage(),
          const WeaponPage(),
          const ChallengePage(),
        ][_currentPageIndex]);
  }
}
