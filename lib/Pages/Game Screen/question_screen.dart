import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Pages/Team%20Screen/team_functions.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  final Function questionComplete;

  const QuestionScreen({
    required this.question,
    required this.questionComplete,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => QuestionScreenState();
}

class QuestionScreenState extends State<QuestionScreen> {
  bool revealAnswer = false;
  bool revealHint = false;
  double points() {
    switch (revealHint) {
      case true:
        return widget.question.points / 2;
      case false:
        return widget.question.points;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 151, 30),
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
      floatingActionButton: FloatingActionButton(
          child:
              revealAnswer ? Icon(Icons.arrow_back) : Icon(Icons.arrow_forward),
          onPressed: () {
            setState(() {
              revealAnswer = !revealAnswer;
              widget.questionComplete();
            });
            if (TeamFunctions.globalTeam.updateState != null) {
              TeamFunctions.globalTeam.updateState!();
            }
          }),
      body: Container(
        color: const Color.fromARGB(255, 40, 151, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 71, 71),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.question.question,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SFs(context: context).screenHeight(0.025),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SFs(context: context).screenHeight(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      widget.question.content(context),
                      if (revealAnswer)
                        Flexible(
                            child: SizedBox(
                          width: SFs(context: context).screenWidth(0.25),
                          child: Text(
                            widget.question.answer,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  SFs(context: context).screenHeight(0.025),
                              color: Colors.white,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        )),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TeamFunctions.globalTeam.teamRed.teamScreen(context, points()),
                SizedBox(
                  width: SFs(context: context).screenWidth(0.1),
                  child: widget.question.hint.isEmpty
                      ? Center()
                      : !revealHint && widget.question.hint.isNotEmpty
                          ? Center(
                              child: GestureDetector(
                                child: Icon(Icons.question_mark),
                                onTap: () {
                                  setState(() {
                                    revealHint = true;
                                  });
                                },
                              ),
                            )
                          : Card(
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Hint:",
                                      style: TextStyle(
                                        fontSize: SFs(context: context)
                                            .screenHeight(0.025),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        widget.question.hint,
                                        style: TextStyle(
                                          fontSize: SFs(context: context)
                                              .screenHeight(0.025),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                ),
                TeamFunctions.globalTeam.teamBlue.teamScreen(context, points()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
