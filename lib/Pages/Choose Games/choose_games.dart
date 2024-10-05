import 'package:flutter/material.dart';

class ChooseGames extends StatelessWidget {
  const ChooseGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Choose your game"),
      ),
      body: Center(child: Container()),
    );
  }
}
