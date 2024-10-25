import 'package:flutter/material.dart';
import 'package:jimmysservice/Pages/Game%20Screen/game_screen.dart';

class Cutscene extends StatelessWidget {
  const Cutscene({super.key});

  VoidCallback gotoGameScreen(BuildContext context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(),
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
