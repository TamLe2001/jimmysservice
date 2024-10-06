import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Rules/rulesbook.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  RulesScreenState createState() => RulesScreenState();
}

class RulesScreenState extends State<RulesScreen> {
  final List<String> rules = [
    "Do not eat while speaking, you bitch",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
    "If you are a dad, then do not return after getting the milk",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text(
          "Elf Etiquette",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.green[400],
        child: RulesBook(
          rules: rules,
        ),
      ),
    );
  }
}
