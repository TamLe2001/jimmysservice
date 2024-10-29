import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Player/player.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';

class Team {
  List<Player> members = [];
  int points = 0;

  int length() {
    return members.length;
  }

  void addPlayer(Player player) {
    if (!members
        .any((e) => e.name.toLowerCase() == player.name.toLowerCase())) {
      members.add(player);
    }
  }

  void remove(Player player) {
    members.remove(player);
  }

  void clear() {
    members.clear();
  }

  Future<Leader> findLeader() async {
    return members.whereType<Leader>().toList().first;
  }

  void makeLeader(Player player) {
    members = members.map((e) {
      if (e != player && e is Leader) {
        return e.toMinion();
      }
      if (e == player && e is Minion) {
        return e.toLeader();
      }
      return e;
    }).toList();
  }

  void makeMinion(Player player) {
    members = members.map((e) {
      if (e == player && e is Leader) {
        return e.toMinion();
      }
      return e;
    }).toList();
  }

  Widget teamScreen(BuildContext context) {
    final sf = SFs(context: context);

    return FutureBuilder(
      future: findLeader(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData) {
          return Center(child: Text("No data available"));
        }
        final leader = snapshot.data!;

        return Container(
          height: double.infinity,
          width: sf.screenWidth(0.2),
          decoration: BoxDecoration(
            color: leader.color,
            borderRadius: BorderRadius.circular(1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  color: Colors.white,
                  height: sf.screenHeight(0.05),
                  width: sf.screenWidth(0.175),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Team",
                        style: TextStyle(
                          fontSize: sf.screenHeight(0.025),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.5),
                        child: leader.playerIcon(
                            context, leader.name.substring(0, 3)),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      points.toString(),
                      style: TextStyle(
                        fontSize: sf.screenHeight(0.025),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
