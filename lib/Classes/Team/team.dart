import 'package:jimmysservice/Classes/Player/player.dart';

class Team {
  List<Player> members = [];

  int length() {
    return members.length;
  }

  void addPlayer(Player player) {
    if (!(members
        .map((e) => e.name.toLowerCase())
        .toList()
        .contains(player.name.toLowerCase()))) {
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
}
