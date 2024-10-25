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
      Question(question: "HEj", points: 200),
      Question(question: "HEj", points: 400),
      Question(question: "HEj", points: 600),
      Question(question: "HEj", points: 800),
      Question(question: "HEj", points: 1000),
    ]),
    Category(category: "Gaming", questions: [
      Question(question: "HEj", points: 200),
      Question(question: "HEj", points: 400),
      Question(question: "HEj", points: 600),
      Question(question: "HEj", points: 800),
      Question(question: "HEj", points: 1000),
    ]),
    Category(category: "Christmas Songs", questions: [
      Question(question: "HEj", points: 200),
      Question(question: "HEj", points: 400),
      Question(question: "HEj", points: 600),
      Question(question: "HEj", points: 800),
      Question(question: "HEj", points: 1000),
    ]),
    Category(category: "Anime", questions: [
      Question(question: "HEj", points: 200),
      Question(question: "HEj", points: 400),
      Question(question: "HEj", points: 600),
      Question(question: "HEj", points: 800),
      Question(question: "HEj", points: 1000),
    ]),
    Category(category: "Nostalgia", questions: [
      Question(question: "HEj", points: 200),
      Question(question: "HEj", points: 400),
      Question(question: "HEj", points: 600),
      Question(question: "HEj", points: 800),
      Question(question: "HEj", points: 1000),
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
