import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Rules/rulebook.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  RulesScreenState createState() => RulesScreenState();
}

class RulesScreenState extends State<RulesScreen> {
  final List<String> rules = [
    "A question will be asked, and the 'leader' will answer on behalf of the group.",
    "Using a hint will earn you half the points if you answer correctly.",
    "Using a hint and answering incorrectly will result in double the penalty.",
    "There is a hidden gift behind one of the questions.",
    "The team that shows the most Christmas spirit will earn bonus stars",
    "The team with the fewest points will end up on Santa's naughty list AND BE PUNISHED!"
  ];

  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }

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
        child: Row(
          children: [
            Expanded(
              child: RuleBook(
                rules: rules,
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/santalist.png'),
                  Positioned(
                    left: screenWidth() * 0.2,
                    top: screenHeight() * 0.4,
                    child: Image.asset(
                      'assets/images/nice.png',
                      width: screenWidth() * 0.3,
                      height: screenHeight() * 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: screenHeight() * 0,
                    top: screenHeight() * 0.4,
                    child: Image.asset(
                      'assets/images/naughty.png',
                      width: screenWidth() * 0.3,
                      height: screenHeight() * 0.3,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
