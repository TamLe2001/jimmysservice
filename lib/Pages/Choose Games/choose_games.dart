import 'package:flutter/material.dart';

class ChooseGames extends StatelessWidget {
  const ChooseGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text(
          "Elf Etiquette",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.green[400],
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
