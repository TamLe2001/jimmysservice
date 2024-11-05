import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Pages/Game%20Screen/question_screen.dart';

import 'package:flutter/material.dart';
import 'package:jimmysservice/Pages/Team%20Screen/team_functions.dart';

abstract class Question extends StatefulWidget {
  final String question;
  final double points;
  final String path;
  final String hint;
  final String answer;

  const Question({
    required this.question,
    required this.points,
    required this.answer,
    required this.path,
    this.hint = '',
    super.key,
  });

  Widget content(BuildContext context);

  @override
  QuestionState createState() => QuestionState();
}

class QuestionState extends State<Question> {
  bool completed = false;

  Function complete() {
    return () {
      setState(() {
        completed = true;
      });
      if (TeamFunctions.globalTeam.updateState != null) {
        TeamFunctions.globalTeam.updateState!();
        print("updateState $completed");
      }
    };
  }

  double height() {
    return SFs(context: context).screenHeight(0.1);
  }

  double width() {
    return double.infinity;
  }

  Widget questionUI(BuildContext context) {
    return completed
        ? SizedBox(
            height: height(),
            width: width(),
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: Center(
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: SFs(context: context).screenHeight(0.05),
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          )
        : Container(
            color: Colors.orange,
            height: height(),
            width: width(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.points.toInt().toString(),
                  style: TextStyle(
                    fontSize: SFs(context: context).screenHeight(0.05),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }

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
                question: widget,
                questionComplete: complete(),
              ),
            ),
          );
        },
        child: questionUI(context),
      ),
    );
  }
}

class ImageQuestion extends Question {
  ImageQuestion({
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
        size: SFs(context: context).screenHeight(0.35),
      ),
    );
  }
}
