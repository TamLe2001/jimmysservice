import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Team/team.dart';
import 'package:jimmysservice/Pages/Game%20Screen/game_screen.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class Cutscene extends StatefulWidget {
  final Team teamRed;
  final Team teamBlue;

  const Cutscene({
    required this.teamRed,
    required this.teamBlue,
    super.key,
  });

  @override
  CutsceneState createState() => CutsceneState();
}

class CutsceneState extends State<Cutscene> {
  late final player = Player();
  late final controller = VideoController(player);
  bool _isVideoEnded = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    player.open(Media('asset:///assets/video/smash.mp4'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void gotoGameScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => gotoGameScreen(),
        child: Text("Skip"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9.0 / 16.0,
          // Use [Video] widget to display video output.
          child: Video(controller: controller),
        ),
      ),
    );
  }
}
