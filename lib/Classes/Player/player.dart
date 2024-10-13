import 'package:flutter/material.dart';

abstract class Player {
  final String name;
  final Color color;

  Player({
    required this.name,
    required this.color,
  });

  CircleAvatar playerIcon(String label) {
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
}

class Leader extends Player {
  Leader({
    required super.name,
    required super.color,
  });
}

class Minion extends Player {
  Minion({
    required super.name,
    required super.color,
  });
}
