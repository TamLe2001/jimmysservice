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

  void clear() {
    members.clear();
  }

  void makeLeader(Player player) {
    members = members.map((e) {
      if (e != player && e is Leader) {
        return e.toMinion();
      }
      if (e == player && e is Minion) {
        return e.toLeader();
      }
      return e;
    }).toList();
  }

  void makeMinion(Player player) {
    members = members.map((e) {
      if (e == player && e is Leader) {
        return e.toMinion();
      }
      return e;
    }).toList();
  }
}
