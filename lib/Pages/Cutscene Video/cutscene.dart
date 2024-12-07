import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Team/team.dart';
import 'package:jimmysservice/Pages/Game%20Screen/game_screen.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController _controller;
  bool _isVideoEnded = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video/smash.mp4')
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isInitialized = true;
            _controller.play();
          });
        }
      }).catchError((error) {
        print('Error initializing video: $error');
      });

    _controller.addListener(() {
      if (_controller.value.hasError) {
        print('Video Player Error: ${_controller.value.errorDescription}');
      }
    });
    print("Jimmy ${_controller.dataSource}");
  }

  @override
  void dispose() {
    _controller.dispose();
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
        child: _isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
