import 'package:jimmysservice/Classes/Player/player.dart';

class Team {
  List<Player> members;

  Team({
    this.members = const [],
  });

  void addmember(Player player) {
    members.add(player);
  }
}
