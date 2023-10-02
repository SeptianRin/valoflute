import 'package:flutter/material.dart';
import 'package:valoflute/views/agentdetail/full_potrait_card.dart';

import '../../models/agent.dart';

class AgentDetailPage extends StatefulWidget {
  const AgentDetailPage({super.key, required this.data});

  final Agent data;

  @override
  State<AgentDetailPage> createState() => _AgentDetailPageState();
}

class _AgentDetailPageState extends State<AgentDetailPage> {
  bool _showRoleName = false;
  int _showSkillDescription = 0;

  @override
  Widget build(BuildContext context) {
    Agent data = widget.data;
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          centerTitle: true,
          bottomOpacity: 0.0,
          elevation: 0.0,
          scrolledUnderElevation: 0,
          title: const Text(
            "Detail",
            style: TextStyle(fontFamily: "Valofont"),
          ),
          backgroundColor: Colors.red,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FullPotraitCard(data: data),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          data.icon,
                          width: 50,
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: Text(data.name,
                              style: const TextStyle(
                                  fontFamily: "BebasNeue", fontSize: 30)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Image.network(
                            data.role.icon,
                            width: 20,
                          ),
                          onTap: () {
                            setState(() {
                              _showRoleName = !_showRoleName;
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: _showRoleName
                              ? Text(
                                  data.role.name,
                                  style:
                                      const TextStyle(fontFamily: "BebasNeue"),
                                )
                              : const Text(""),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Text("Abilities",
                  style: TextStyle(fontFamily: "BebasNeue", fontSize: 30)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _showSkillDescription = 0;
                            });
                          },
                          child: Image.network(
                            data.abilities[0].icon,
                            width: 35,
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _showSkillDescription = 1;
                            });
                          },
                          child: Image.network(
                            data.abilities[1].icon,
                            width: 35,
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _showSkillDescription = 2;
                            });
                          },
                          child: Image.network(
                            data.abilities[2].icon,
                            width: 35,
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _showSkillDescription = 3;
                            });
                          },
                          child: Image.network(
                            data.abilities[3].icon,
                            width: 35,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(data.abilities[_showSkillDescription].name,
                        style: const TextStyle(
                            fontFamily: "BebasNeue", fontSize: 25)),
                    RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text: data.abilities[_showSkillDescription].desc,
                            style: const TextStyle(
                                fontFamily: "BebasNeue", fontSize: 20))),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
