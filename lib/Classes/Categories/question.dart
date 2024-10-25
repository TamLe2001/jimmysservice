import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';

class Question extends StatelessWidget {
  final String question;
  final int points;
  final String? hint;
  final String? image;
  final AudioPlayer? music;

  const Question({
    required this.question,
    required this.points,
    this.hint,
    this.image,
    this.music,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: Container(
          color: Colors.orange,
          height: ScreenFunctions(context: context).screenHeight() * 0.1,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$points",
                style: TextStyle(
                    fontSize:
                        ScreenFunctions(context: context).screenHeight() * 0.05,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
