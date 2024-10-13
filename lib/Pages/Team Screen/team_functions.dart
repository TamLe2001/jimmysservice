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
                  players.add(
                    Minion(
                      name: newPlayer.text,
                    ),
                  );
                  playerLength.value = players.length;
                  newPlayer.text = '';
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
}
