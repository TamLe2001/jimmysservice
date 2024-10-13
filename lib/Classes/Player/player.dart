import 'package:flutter/material.dart';

abstract class Player {
  final String name;
  final Color color;

  Player({
    required this.name,
    required this.color,
  });
}

class Leader implements Player {
  @override
  final String name;
  @override
  final Color color;

  Leader({
    required this.name,
    required this.color,
  });
}

class Minion implements Player {
  @override
  final String name;
  @override
  final Color color;

  Minion({
    required this.name,
    required this.color,
  });
}
