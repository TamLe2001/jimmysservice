import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';

abstract class Player {
  final String name;
  final Color color;
  ValueChanged<String?> hoverUpdater;

  Player({
    required this.name,
    required this.color,
    required this.hoverUpdater,
  });

  Player updateHover(ValueChanged<String?> newHover) {
    hoverUpdater = newHover;
    return this;
  }

  Widget playerIcon(BuildContext context, String label) {
    return MouseRegion(
      onEnter: (_) {
        hoverUpdater(name);
      },
      onExit: (_) {
        hoverUpdater(null);
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: SFs(context: context).screenHeight(0.025),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: SFs(context: context).screenHeight(0.02),
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

  Minion toMinion() {
    return Minion(
      name: name,
      color: color,
      hoverUpdater: hoverUpdater,
    );
  }
}

class Minion extends Player {
  Minion({
    required super.name,
    required super.color,
    required super.hoverUpdater,
  });

  Leader toLeader() {
    return Leader(
      name: name,
      color: color,
      hoverUpdater: hoverUpdater,
    );
  }
}
