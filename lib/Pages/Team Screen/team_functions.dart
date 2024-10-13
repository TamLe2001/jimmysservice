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

  TeamFunctions({required this.context});

  List<Player> players = [];
  ValueNotifier<int> playerLength = ValueNotifier<int>(0);
  Team teamRed = Team();
  Team teamBlue = Team();

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
            title: const Text('Enter Player Name'),
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
                    players.add(
                      Minion(name: newPlayer.text, color: getRandomColor()),
                    );
                    playerLength.value = players.length;
                    newPlayer.text = '';
                  }
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

  List<Draggable<String>> listBuilder() {
    CircleAvatar playerIcon(String label, Color color) {
      return CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      );
    }

    String getUniqueLabel(String name, List<String> allNames) {
      String lowerCaseName = name.toLowerCase();
      List<String> lowerCaseNames =
          allNames.map((n) => n.toLowerCase()).toList();

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

    List<Draggable<String>> playerIcons = players.map(
      (player) {
        String name = player.name;
        String label =
            getUniqueLabel(name, players.map((p) => p.name).toList());

        final widget = playerIcon(label, player.color);

        return Draggable<String>(
          data: player.name,
          feedback: widget,
          childWhenDragging: Opacity(
            opacity: 0.5,
            child: widget,
          ),
          onDragCompleted: () {},
          child: widget,
        );
      },
    ).toList();

    return playerIcons;
  }

  Widget teamScroll(TeamSelect selection) {
    Color? color;
    List<Player> players = [];

    switch (selection) {
      case TeamSelect.red:
        color = Colors.red;
        teamRed.members = [
          Minion(
            name: "Lag",
            color: Colors.red,
          ),
        ];
        players = teamRed.members;
      case TeamSelect.blue:
        color = Colors.blue;
        players = teamBlue.members;
    }

    return Flexible(
      child: Container(
        color: color,
        height: double.infinity,
        width: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Container(
                color: Colors.white,
                height: ScreenFunctions(context: context).screenHeight() * 0.5,
                width: ScreenFunctions(context: context).screenWidth() * 0.2,
                child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
