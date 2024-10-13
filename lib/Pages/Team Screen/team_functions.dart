import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Player/player.dart';
import 'package:jimmysservice/Classes/Team/team.dart';

class TeamFunctions {
  final BuildContext context;

  TeamFunctions({required this.context});

  List<Player> players = [];
  ValueNotifier<int> playerLength = ValueNotifier<int>(0);
  Team teamA = Team();
  Team teamB = Team();

  VoidCallback addPlayer() {
    TextEditingController newPlayer = TextEditingController();
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
                      Minion(
                        name: newPlayer.text,
                      ),
                    );
                    playerLength.value = players.length; // Update ValueNotifier
                    newPlayer.text = ''; // Reset text field
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
    Color getRandomColor() {
      Random random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    CircleAvatar playerIcon(String label, Color color) {
      return CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      );
    }

    Map<String, int> firstLetterCount = {};
    for (var player in players) {
      String firstLetter =
          player.name.isNotEmpty ? player.name.substring(0, 1) : "?";
      firstLetterCount[firstLetter] = (firstLetterCount[firstLetter] ?? 0) + 1;
    }

    List<Draggable<String>> playerIcons = players.map((player) {
      String name = player.name;
      String label = "";
      Color randomColor = getRandomColor();

      if (name.isNotEmpty) {
        String firstLetter = name.substring(0, 1);

        if (firstLetterCount[firstLetter]! == 2) {
          label = name.length > 1 ? name.substring(0, 2) : firstLetter;
        } else if (firstLetterCount[firstLetter]! > 2) {
          label = name.length > 2 ? name.substring(0, 3) : name;
        } else {
          label = firstLetter;
        }
      } else {
        label = "?";
      }

      final widget = playerIcon(label, randomColor);

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
    }).toList();

    return playerIcons;
  }
}
