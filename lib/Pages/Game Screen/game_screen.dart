import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/category.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

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
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: categories,
          ),
          Container(
            color: Colors.black,
            height: 10,
            width: 10,
          )
        ],
      ),
    );
  }
}
