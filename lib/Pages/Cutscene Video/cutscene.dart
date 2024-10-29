import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Team/team.dart';
import 'package:jimmysservice/Pages/Game%20Screen/game_screen.dart';

class Cutscene extends StatelessWidget {
  final Team teamRed;
  final Team teamBlue;
  const Cutscene({
    required this.teamRed,
    required this.teamBlue,
    super.key,
  });

  VoidCallback gotoGameScreen(BuildContext context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(
            teamRed: teamRed,
            teamBlue: teamBlue,
          ),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: gotoGameScreen(context),
        child: Text("Skip"),
      ),
    );
  }
}
