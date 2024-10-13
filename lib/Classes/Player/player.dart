import 'package:flutter/material.dart';

abstract class Player {
  final String name;
  final Color color;
  final ValueChanged<String?> hoverUpdater;

  Player({
    required this.name,
    required this.color,
    required this.hoverUpdater,
  });

  Widget playerIcon(String label) {
    return MouseRegion(
      onEnter: (_) {
        hoverUpdater(name);
      },
      onExit: (_) {
        hoverUpdater(null);
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
    required super.hoverUpdater,
  });
}

class Minion extends Player {
  Minion({
    required super.name,
    required super.color,
    required super.hoverUpdater,
  });
}
