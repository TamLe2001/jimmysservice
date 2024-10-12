abstract class Player {
  final String name;

  Player({
    required this.name,
  });
}

class Leader implements Player {
  @override
  final String name;

  Leader({
    required this.name,
  });
}

class Minion implements Player {
  @override
  final String name;

  Minion({
    required this.name,
  });
}
