import 'package:flutter/material.dart';

abstract class Player {
  final String name;
  final Color color;
  final ValueChanged<String>? hoverUpdater;

  Player({
    required this.name,
    required this.color,
    this.hoverUpdater,
  });

  Widget playerIcon(String label) {
    return MouseRegion(
      onEnter: (_) {
        if (hoverUpdater != null) {
          hoverUpdater!(name);
        }
      },
      onExit: (_) {
        if (hoverUpdater != null) {
          hoverUpdater!("");
        }
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Leader extends Player {
  Leader({
    required super.name,
    required super.color,
    super.hoverUpdater,
  });
}

class Minion extends Player {
  Minion({
    required super.name,
    required super.color,
    super.hoverUpdater,
  });
}
