import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Player/player.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Classes/Team/team.dart';

enum TeamSelect {
  red,
  blue,
}

class TeamFunctions {
  final BuildContext context;
  final ValueChanged<String?> hoverUpdater;
  final Function? updateState;

  TeamFunctions(
      {required this.context, required this.hoverUpdater, this.updateState});

  Team allPlayers = Team();
  ValueNotifier<int> playerLength = ValueNotifier<int>(0);
  Team teamRed = Team();
  Team teamBlue = Team();
  void superUpdate() {
    playerLength.value = allPlayers.length();

    if (updateState != null) {
      updateState!();
    }
  }

  Team totalPlayers() {
    Team team = Team();
    team.members = teamBlue.members + teamRed.members + allPlayers.members;
    return team;
  }

  VoidCallback teamClear() {
    return () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Shenron'),
            content: Text(
                'I am Shenron. I shall grant you any one wish. Now speak.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: teamClearTeam(),
                child: const Text('Clear Teams'),
              ),
              TextButton(
                onPressed: teamClearAll(),
                child: const Text('Clear ALL'),
              ),
            ],
          );
        },
      );
    };
  }

  VoidCallback teamClearTeam() {
    return () {
      allPlayers.members += teamBlue.members + teamRed.members;
      teamBlue.clear();
      teamRed.clear();
      superUpdate();
      Navigator.of(context).pop();
    };
  }

  VoidCallback teamClearAll() {
    return () {
      teamBlue.clear();
      teamRed.clear();
      allPlayers.clear();
      superUpdate();
      Navigator.of(context).pop();
    };
  }

  VoidCallback addPlayer() {
    TextEditingController newPlayer = TextEditingController();
    Color getRandomColor() {
      Random random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    return () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Player'),
            content: TextField(
              controller: newPlayer,
              decoration: const InputDecoration(
                hintText: 'Player Name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Closes the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (newPlayer.text.isNotEmpty) {
                    final playerNames = totalPlayers()
                        .members
                        .map((e) => e.name.toLowerCase())
                        .toList();
                    if (!playerNames.contains(newPlayer.text.toLowerCase())) {
                      allPlayers.addPlayer(
                        Minion(
                          name: newPlayer.text,
                          color: getRandomColor(),
                          hoverUpdater: hoverUpdater,
                        ),
                      );
                    }
                    newPlayer.text = '';
                  }
                  superUpdate();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    };
  }

  String _getUniqueLabel(String name, List<String> allNames) {
    String lowerCaseName = name.toLowerCase();
    List<String> lowerCaseNames = allNames.map((n) => n.toLowerCase()).toList();

    String label = lowerCaseName.substring(0, 1);
    int i = 1;

    while (lowerCaseNames.where((n) => n.startsWith(label)).length > 1 &&
        i < name.length) {
      i++;
      label = lowerCaseName.substring(0, i);
      if (i == 3) {
        break;
      }
    }

    return label.toUpperCase();
  }

  List<Draggable<Player>> listBuilder() {
    List<Draggable<Player>> playerIcons = allPlayers.members.map(
      (player) {
        String name = player.name;
        String label = _getUniqueLabel(
          name,
          allPlayers.members.map((p) => p.name).toList(),
        );

        final widget = player.playerIcon(label);

        return Draggable<Player>(
          data: player,
          feedback: widget,
          childWhenDragging: Opacity(
            opacity: 0.5,
            child: widget,
          ),
          onDragUpdate: (details) {
            hoverUpdater(player.name);
          },
          onDragEnd: (details) {
            hoverUpdater(null);
          },
          onDragCompleted: () {
            allPlayers.remove(player);
            superUpdate();
          },
          child: widget,
        );
      },
    ).toList();

    return playerIcons;
  }

  Widget teamScroll(TeamSelect selection) {
    Color? color;
    Team players = Team();

    switch (selection) {
      case TeamSelect.red:
        color = Colors.red;
        players.members = teamRed.members;
      case TeamSelect.blue:
        color = Colors.blue;
        players.members = teamBlue.members;
    }

    return Flexible(
      child: Container(
        color: color,
        height: double.infinity,
        width: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: DragTarget(
            onAcceptWithDetails: (details) {
              final droppedPlayer = details.data as Player;

              if (selection == TeamSelect.red) {
                teamRed.addPlayer(droppedPlayer);
              } else if (selection == TeamSelect.blue) {
                teamBlue.addPlayer(droppedPlayer);
              }

              superUpdate();
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: ScreenFunctions(context: context).screenHeight() * 0.5,
                width: ScreenFunctions(context: context).screenWidth() * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: ListView.builder(
                    itemCount: players.length(),
                    itemBuilder: (context, index) {
                      final player = players.members[index];

                      String label = _getUniqueLabel(
                        player.name,
                        players.members.map((p) => p.name).toList(),
                      );

                      return ListTile(
                        leading: player.playerIcon(label),
                        title: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          player.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            if (player is Minion) ...[
                              IconButton(
                                onPressed: () {
                                  for (var player in players.members) {
                                    if (player is Leader) {
                                      final minion = Minion(
                                        name: player.name,
                                        color: player.color,
                                        hoverUpdater: hoverUpdater,
                                      );
                                      players.remove(player);
                                      players.addPlayer(minion);
                                    }
                                  }

                                  final leader = Leader(
                                    name: player.name,
                                    color: player.color,
                                    hoverUpdater: hoverUpdater,
                                  );
                                  players.remove(player);
                                  players.insert(0, leader);
                                  superUpdate();
                                },
                                icon: const Icon(
                                  Icons.star_border,
                                ),
                              ),
                            ] else if (player is Leader) ...[
                              IconButton(
                                onPressed: () {
                                  final minion = Minion(
                                    name: player.name,
                                    color: player.color,
                                    hoverUpdater: hoverUpdater,
                                  );
                                  players.remove(player);
                                  players.insert(0, minion);
                                  superUpdate();
                                },
                                icon: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
                            IconButton(
                              onPressed: () {
                                final kickedPlayer = Minion(
                                  name: player.name,
                                  color: player.color,
                                  hoverUpdater: hoverUpdater,
                                );
                                players.remove(player);

                                final playerNames = totalPlayers()
                                    .members
                                    .map((e) => e.name.toLowerCase())
                                    .toList();

                                if (!playerNames
                                    .contains(player.name.toLowerCase())) {
                                  allPlayers.addPlayer(kickedPlayer);
                                }
                                superUpdate();
                              },
                              icon: const Icon(
                                Icons.close,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
