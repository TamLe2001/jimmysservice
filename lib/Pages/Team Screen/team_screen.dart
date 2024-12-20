import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Player/player.dart';
import 'package:jimmysservice/Pages/Cutscene%20Video/cutscene.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Pages/Team%20Screen/team_functions.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  TeamScreenState createState() => TeamScreenState();
}

class TeamScreenState extends State<TeamScreen> {
  late TeamFunctions teamFunctions;
  late SFs screenFunctions;
  String hoveredText = '';

  void _updateHoveredText([String? text]) {
    setState(() {
      hoveredText = text ?? '';
    });
  }

  Function updateState() {
    return () {
      setState(() {
        teamFunctions.teamBlue.members = teamFunctions.teamBlue.members;
        teamFunctions.teamRed.members = teamFunctions.teamRed.members;
      });
    };
  }

  @override
  void initState() {
    super.initState();
    teamFunctions = TeamFunctions(
      context: context,
      hoverUpdater: _updateHoveredText,
      updateState: updateState(),
    );
    screenFunctions = SFs(context: context);
  }

  VoidCallback? gotoCutScene() {
    final cutscene = Cutscene(
      teamRed: teamFunctions.teamRed,
      teamBlue: teamFunctions.teamBlue,
    );
    if (teamFunctions.teamRed.members.whereType<Leader>().toList().isNotEmpty &&
        teamFunctions.teamBlue.members
            .whereType<Leader>()
            .toList()
            .isNotEmpty) {
      return () {
        TeamFunctions.create(teamFunctions).then(
          (onValue) {
            if (mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => cutscene,
                ),
              );
            }
          },
        );
      };
    }
    return () {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: gotoCutScene(),
        child: const Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text(
          "Team Creation",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: teamFunctions.playerLength,
        builder: (context, value, child) {
          return Center(
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      teamFunctions.teamScroll(TeamSelect.red),
                      Container(
                        color: Colors.green,
                        width: screenFunctions.screenWidth(0.2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Seleceted:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        screenFunctions.screenWidth(0.015),
                                  ),
                                ),
                                Text(
                                  hoveredText,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenFunctions.screenWidth(0.01),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: teamFunctions.randomizeTeams(),
                              child: Center(
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          screenFunctions.screenWidth(0.02),
                                      vertical:
                                          screenFunctions.screenHeight(0.01),
                                    ),
                                    child: Text(
                                      "Randomize",
                                      style: TextStyle(
                                        fontSize:
                                            screenFunctions.screenWidth(0.016),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: teamFunctions.teamClear(),
                              child: Center(
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          screenFunctions.screenWidth(0.02),
                                      vertical:
                                          screenFunctions.screenHeight(0.01),
                                    ),
                                    child: Text(
                                      "Clear Teams",
                                      style: TextStyle(
                                        fontSize:
                                            screenFunctions.screenWidth(0.016),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      teamFunctions.teamScroll(TeamSelect.blue),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: teamFunctions.addPlayer(),
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenFunctions.screenWidth(0.02),
                            vertical: screenFunctions.screenHeight(0.001),
                          ),
                          child: Text(
                            "Players: $value",
                            style: TextStyle(
                              fontSize: screenFunctions.screenWidth(0.016),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screenFunctions.screenHeight(0.23),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: teamFunctions.listBuilder(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
