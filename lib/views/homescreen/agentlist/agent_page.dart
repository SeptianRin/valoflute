import 'package:flutter/material.dart';
import 'package:valoflute/views/agentdetail/agent_detail_page.dart';

import '../../../models/agent.dart';

class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return isPotrait ? agentListView(context) : agentGridView();
  }

  Widget agentListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listAgent.map((agent) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AgentDetailPage(data: agent)));
                        },
                        child: Card(
                            elevation: 4.0,
                            color: Colors.white12,
                            child: Stack(
                              children: [
                                FittedBox(
                                    fit: BoxFit.fill,
                                    child: Container(
                                      margin: const EdgeInsets.all(16),
                                      child: Text(
                                        agent.role.name,
                                        style: TextStyle(
                                            fontFamily: "Valofont",
                                            fontSize: 100,
                                            color:
                                                Colors.white.withOpacity(0.2)),
                                      ),
                                    )),
                                Row(
                                  children: [
                                    Image.network(
                                      agent.icon,
                                      width: 120,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        agent.name,
                                        textScaleFactor: 2,
                                        style: const TextStyle(
                                            fontFamily: "Valofont"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))),
                  );
                }).toList())),
      ],
    );
  }

  Widget agentGridView() {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: listAgent.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 150,
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AgentDetailPage(data: listAgent[index])));
              },
              child: Card(
                  elevation: 4.0,
                  color: Colors.white12,
                  child: Stack(
                    children: [
                      Center(
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              child: Text(
                                listAgent[index].role.name,
                                style: TextStyle(
                                    fontFamily: "Valofont",
                                    fontSize: 50,
                                    color: Colors.white.withOpacity(0.2)),
                              ),
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            listAgent[index].icon,
                            width: 150,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 16),
                            child: Text(
                              listAgent[index].name,
                              textScaleFactor: 2,
                              style: const TextStyle(fontFamily: "Valofont"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))),
        );
      },
    );
  }
}
