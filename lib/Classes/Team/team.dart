import 'package:jimmysservice/Classes/Player/player.dart';

class Team {
  List<Player> members = [];

  int length() {
    return members.length;
  }

  void addPlayer(Player player) {
    if (!members
        .any((e) => e.name.toLowerCase() == player.name.toLowerCase())) {
      members.add(player);
    }
  }

  void remove(Player player) {
    members.remove(player);
  }

  void insert(int index, Player element) {
    members.insert(index, element);
  }

  void clear() {
    members.clear();
  }

  void makeLeader(Player player) {
    members.removeWhere((p) => p is Leader);

    final leader = Leader(
      name: player.name,
      color: player.color,
      hoverUpdater: player.hoverUpdater,
    );

    remove(player);
    insert(0, leader);
  }

  void makeMinion(Player player) {
    if (player is Leader) {
      final minion = Minion(
        name: player.name,
        color: player.color,
        hoverUpdater: player.hoverUpdater,
      );
      remove(player);
      insert(0, minion);
    }
  }
}
