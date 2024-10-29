import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/category.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';
import 'package:jimmysservice/Classes/Team/team.dart';

class GameScreen extends StatefulWidget {
  final Team teamRed;
  final Team teamBlue;
  const GameScreen({
    required this.teamRed,
    required this.teamBlue,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final List<Category> categories = [
    Category(category: "Combined people", questions: [
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
    ]),
    Category(category: "Gaming", questions: [
      ImageQuestion(question: "HEj", points: 200, answer: "gay"),
      ImageQuestion(question: "HEj", points: 400, answer: "gay"),
      ImageQuestion(question: "HEj", points: 600, answer: "gay"),
      ImageQuestion(question: "HEj", points: 800, answer: "gay"),
      ImageQuestion(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "Christmas Songs", questions: [
      AudioQuestion(
        question: "What Christmas song is this?",
        points: 200,
        answer: "Santa tell me by Ariana Grande",
        path: "santatellme.mp3",
      ),
      ImageQuestion(question: "HEj", points: 400, answer: "gay"),
      ImageQuestion(question: "HEj", points: 600, answer: "gay"),
      ImageQuestion(question: "HEj", points: 800, answer: "gay"),
      ImageQuestion(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "Anime", questions: [
      ImageQuestion(question: "HEj", points: 200, answer: "gay"),
      ImageQuestion(question: "HEj", points: 400, answer: "gay"),
      ImageQuestion(question: "HEj", points: 600, answer: "gay"),
      ImageQuestion(question: "HEj", points: 800, answer: "gay"),
      ImageQuestion(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "2000's Nostalgia", questions: [
      ImageQuestion(question: "HEj", points: 200, answer: "gay"),
      ImageQuestion(question: "HEj", points: 400, answer: "gay"),
      ImageQuestion(question: "HEj", points: 600, answer: "gay"),
      ImageQuestion(question: "HEj", points: 800, answer: "gay"),
      ImageQuestion(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "Korean Pop Culture", questions: [
      ImageQuestion(question: "HEj", points: 200, answer: "gay"),
      ImageQuestion(question: "HEj", points: 400, answer: "gay"),
      ImageQuestion(question: "HEj", points: 600, answer: "gay"),
      ImageQuestion(question: "HEj", points: 800, answer: "gay"),
      ImageQuestion(question: "HEj", points: 1000, answer: "gay"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: categories,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.teamRed.teamScreen(context),
                  widget.teamBlue.teamScreen(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
