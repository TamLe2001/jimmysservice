import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/category.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Pages/Team%20Screen/team_functions.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final ValueNotifier<String> hoveredText = ValueNotifier<String>('');

  void _updateHoveredText([String? text]) {
    hoveredText.value = text ?? '';
  }

  Function updateState() {
    return () {
      setState(() {});
    };
  }

  @override
  void initState() {
    super.initState();
    final tempTeam = TeamFunctions(
      context: context,
      hoverUpdater: _updateHoveredText,
      updateState: updateState(),
    );
    tempTeam.teamRed.members = TeamFunctions.globalTeam.teamRed.members;
    tempTeam.teamBlue.members = TeamFunctions.globalTeam.teamBlue.members;
    tempTeam.teamRed.members =
        TeamFunctions.globalTeam.teamRed.members.map((member) {
      return member.updateHover(_updateHoveredText);
    }).toList();
    tempTeam.teamBlue.members =
        TeamFunctions.globalTeam.teamBlue.members.map((member) {
      return member.updateHover(_updateHoveredText);
    }).toList();
    TeamFunctions.globalTeam = tempTeam;
  }

  List<Category> categories() {
    return [
      Category(
        category: "Combined people",
        questions: [
          ImageQuestion(
            question: "Who am I?",
            points: 200,
            answer: "Kevin Luu & Philip",
            path: "guesswho1.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 400,
            answer: "Sofie & Danny",
            path: "guesswho2.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 600,
            answer: "Casper & Johnny Sins",
            path: "guesswho3.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 800,
            answer: "Abdi & James Charles",
            path: "guesswho4.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 1000,
            answer: "Helene, Jeanete & Marie",
            path: "guesswho5.png",
          ),
        ],
      ),
      Category(
        category: "Gaming",
        questions: [
          ImageQuestion(question: "HEj", points: 200, answer: "gay"),
          ImageQuestion(question: "HEj", points: 400, answer: "gay"),
          ImageQuestion(question: "HEj", points: 600, answer: "gay"),
          ImageQuestion(question: "HEj", points: 800, answer: "gay"),
          ImageQuestion(question: "HEj", points: 1000, answer: "gay"),
        ],
      ),
      Category(
        category: "Christmas Songs",
        questions: [
          AudioQuestion(
            question: "What Christmas song is this?",
            points: 200,
            answer: "Santa tell me by Ariana Grande",
            hint: "my name is kenny",
            path: "santatellme.mp3",
          ),
          ImageQuestion(
            question: "HEj",
            points: 400,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 600,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 800,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 1000,
            answer: "gay",
          ),
        ],
      ),
      Category(
        category: "Anime",
        questions: [
          ImageQuestion(
            question: "HEj",
            points: 200,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 400,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 600,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 800,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 1000,
            answer: "gay",
          ),
        ],
      ),
      Category(
        category: "2000's Nostalgia",
        questions: [
          ImageQuestion(
            question: "HEj",
            points: 200,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 400,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 600,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 800,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 1000,
            answer: "gay",
          ),
        ],
      ),
      Category(
        category: "Korean Pop Culture",
        questions: [
          ImageQuestion(
            question: "HEj",
            points: 200,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 400,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 600,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 800,
            answer: "gay",
          ),
          ImageQuestion(
            question: "HEj",
            points: 1000,
            answer: "gay",
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            Row(
              children: categories(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TeamFunctions.globalTeam.teamRed.teamScreen(context, 100),
                  SizedBox(
                    width: SFs(context: context).screenWidth(0.1),
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: hoveredText,
                        builder: (context, value, child) {
                          return Text(
                            value,
                          );
                        },
                      ),
                    ),
                  ),
                  TeamFunctions.globalTeam.teamBlue.teamScreen(context, 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
