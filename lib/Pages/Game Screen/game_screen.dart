import 'package:audioplayers/audioplayers.dart';
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
      Question(question: "Who am I?", points: 200, answer: "gay"),
      Question(question: "Who am I?", points: 400, answer: "gay"),
      Question(question: "Who am I?", points: 600, answer: "gay"),
      Question(question: "Who am I?", points: 800, answer: "gay"),
      Question(question: "Who am I?", points: 1000, answer: "gay"),
    ]),
    Category(category: "Gaming", questions: [
      Question(question: "HEj", points: 200, answer: "gay"),
      Question(question: "HEj", points: 400, answer: "gay"),
      Question(question: "HEj", points: 600, answer: "gay"),
      Question(question: "HEj", points: 800, answer: "gay"),
      Question(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "Christmas Songs", questions: [
      Question(
        question: "What Christmas song is this?",
        points: 200,
        answer: "Santa tell me by Ariana Grande",
        music: AssetSource("audio/santatellme.mp3"),
      ),
      Question(question: "HEj", points: 400, answer: "gay"),
      Question(question: "HEj", points: 600, answer: "gay"),
      Question(question: "HEj", points: 800, answer: "gay"),
      Question(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "Anime", questions: [
      Question(question: "HEj", points: 200, answer: "gay"),
      Question(question: "HEj", points: 400, answer: "gay"),
      Question(question: "HEj", points: 600, answer: "gay"),
      Question(question: "HEj", points: 800, answer: "gay"),
      Question(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "2000's Nostalgia", questions: [
      Question(question: "HEj", points: 200, answer: "gay"),
      Question(question: "HEj", points: 400, answer: "gay"),
      Question(question: "HEj", points: 600, answer: "gay"),
      Question(question: "HEj", points: 800, answer: "gay"),
      Question(question: "HEj", points: 1000, answer: "gay"),
    ]),
    Category(category: "Korean Pop Culture", questions: [
      Question(question: "HEj", points: 200, answer: "gay"),
      Question(question: "HEj", points: 400, answer: "gay"),
      Question(question: "HEj", points: 600, answer: "gay"),
      Question(question: "HEj", points: 800, answer: "gay"),
      Question(question: "HEj", points: 1000, answer: "gay"),
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
