import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Rules/rulebook.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';
import 'package:jimmysservice/Pages/Team%20Screen/team_screen.dart';

class RulesScreen extends StatefulWidget {
  final AudioPlayer? music;
  const RulesScreen({this.music, super.key});

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

  late SFs screenFunctions;

  @override
  void initState() {
    super.initState();
    screenFunctions = SFs(context: context);
  }

  VoidCallback? gotoTeamScreen() {
    return () {
      widget.music?.stop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeamScreen(),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: gotoTeamScreen(),
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
                    left: screenFunctions.screenWidth(0.2),
                    top: screenFunctions.screenHeight(0.4),
                    child: Image.asset(
                      'assets/images/nice.png',
                      width: screenFunctions.screenWidth(0.3),
                      height: screenFunctions.screenHeight(0.3),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: screenFunctions.screenWidth(0),
                    top: screenFunctions.screenHeight(0.4),
                    child: Image.asset(
                      'assets/images/naughty.png',
                      width: screenFunctions.screenWidth(0.3),
                      height: screenFunctions.screenHeight(0.3),
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
