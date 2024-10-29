import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Pages/Game%20Screen/question_screen.dart';

abstract class Question extends StatelessWidget {
  final String question;
  final int points;
  final String path;
  final String? hint;
  final String answer;

  const Question({
    required this.question,
    required this.points,
    required this.answer,
    required this.path,
    this.hint,
    super.key,
  });

  Widget content(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionScreen(
                question: this,
              ),
            ),
          );
        },
        child: Container(
          color: Colors.orange,
          height: SFs(context: context).screenHeight() * 0.1,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$points",
                style: TextStyle(
                    fontSize: SFs(context: context).screenHeight() * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageQuestion extends Question {
  const ImageQuestion({
    required super.question,
    required super.points,
    required super.answer,
    super.path = "",
    super.hint,
    super.key,
  });

  @override
  Widget content(BuildContext context) {
    return Image.asset("assets/images/$path");
  }
}

class AudioQuestion extends Question {
  AudioQuestion({
    required super.question,
    required super.points,
    required super.answer,
    super.path = "",
    super.hint,
    super.key,
  });

  final audioPlayer = AudioPlayer();

  void audioStop() {
    audioPlayer.stop();
  }

  @override
  Widget content(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AssetSource myPath = AssetSource("audio/$path");
        await audioPlayer.setSource(myPath);
        audioPlayer.play(myPath);
      },
      child: Icon(
        Icons.play_arrow,
        size: SFs(context: context).screenHeight() * 0.5,
      ),
    );
  }
}
