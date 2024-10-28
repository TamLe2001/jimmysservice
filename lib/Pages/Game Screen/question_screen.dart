import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;

  const QuestionScreen({super.key, required this.question});

  @override
  State<StatefulWidget> createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (widget.question is AudioQuestion) {
              AudioQuestion audio = widget.question as AudioQuestion;
              audio.audioStop();
            }
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.question.question,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ScreenFunctions(context: context).screenHeight() *
                                0.025,
                        color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widget.question.content(context),
                  Text(
                    widget.question.answer,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ScreenFunctions(context: context).screenHeight() *
                                0.025,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
