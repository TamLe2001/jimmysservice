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
        category: "Sanrio Showdown",
        questions: [
          ImageQuestion(
            question: "Hvem er jeg?",
            points: 200,
            answer: "Mimmy",
            hint: "Hello Kitty's søster",
            path: "sanrio1.png",
          ),
          ImageQuestion(
            question: "Hvem er jeg?",
            points: 400,
            answer: "Batzmaru",
            hint: "Kuromi's boyfriend",
            path: "sanrio 2.png",
          ),
          ImageQuestion(
            question: "Hvem er jeg?",
            points: 600,
            answer: "Hangyudon",
            hint: "Japanese Beef Bowl",
            path: "sanrio3.png",
          ),
          ImageQuestion(
            question: "Hvem er jeg?",
            points: 800,
            answer: "Chococat",
            hint: "I'm a cat",
            path: "sanrio4.png",
          ),
          ImageQuestion(
            question: "Hvem er vi?",
            points: 1000,
            answer: "Lala & Kiki",
            hint: "Pigen hedder Lala",
            path: "sanrio5.png",
          ),
        ],
      ),
      Category(
        category: "The Birthday Gurl",
        questions: [
          ImageQuestion(
            question: "Hvornår blev Jeanette født?",
            points: 200,
            answer: "27. August 2000",
            hint: "Leave if you don't know this",
            path: "birthdaygirl1.png",
          ),
          ImageQuestion(
            question: "Hvad er Jeanettes favorite noodle?",
            points: 400,
            answer: "Udon",
            hint: "Long and Thick",
            path: "birthdaygirl2.png",
          ),
          ImageQuestion(
            question: "Hvor gammel er Jeanette her?",
            points: 600,
            answer: "13",
            hint: "Newborn teenager",
            path: "birthdaygirl3.png",
          ),
          ImageQuestion(
            question: "Hvem var Jeanettes første Crush?",
            points: 800,
            answer: "Mathias Wendelbo",
            hint: "It ain't Jimmy",
            path: "birthdaygirl4.png",
          ),
          ImageQuestion(
            question: "Hvilken tand var helt fukt som barn, men cute?",
            points: 1000,
            answer: "En meget cute tand",
            hint: "I cooked",
            path: "birthdaygirl5.png",
          ),
        ],
      ),
      Category(
        category: "All around the World",
        questions: [
          ImageQuestion(
            question: "Where she at?",
            points: 200,
            answer: "Home",
            hint: "Where u at?",
            path: "theworld1.png",
          ),
          ImageQuestion(
            question: "Where she at?",
            points: 400,
            answer: "Rhodos, Greece",
            hint: "Zeus, Hercules & Hades",
            path: "theworld2.png",
          ),
          ImageQuestion(
            question: "Where she at?",
            points: 600,
            answer: "Copenhagen, Denmark",
            hint: "J-pop Con",
            path: "theworld3.png",
          ),
          ImageQuestion(
            question: "Where she at?",
            points: 800,
            answer: "Porto, Portugal",
            hint: "SUUUUUUUUUUUI!",
            path: "theworld4.png",
          ),
          ImageQuestion(
            question: "Where she at?",
            points: 1000,
            answer: "Budapest, Ungarn",
            hint: "The enlightened + rats",
            path: "theworld5.png",
          ),
        ],
      ),
      Category(
        category: "The Year 2000",
        questions: [
          AudioQuestion(
            question:
                "This pop star released “Oops!... I Did It Again” in 2000, making her one of the best-selling artists of the year",
            points: 200,
            answer: "Britney Spears",
            hint: "It's Britney Bitch",
            path: "Year1.mp3",
          ),
          ImageQuestion(
            question:
                "This gaming console, released in March 2000, became the best-selling console of all time",
            points: 400,
            answer: "Playstation 2",
            hint: "Not Xbox",
            path: "Year2.png",
          ),
          ImageQuestion(
            question:
                "The Summer Olympics in 2000 were held in this city, marking the first Games of the new millennium",
            points: 600,
            answer: "Sydney",
            hint: "Kangaroo",
            path: "Year3.png",
          ),
          ImageQuestion(
            question:
                "Tiny sunglasses, metallic fabrics, and shiny accessories defined this early-2000s futuristic aesthetic",
            points: 800,
            answer: "Y2K",
            hint: "Why two Kay",
            path: "Year4.png",
          ),
          ImageQuestion(
            question:
                "This handheld digital pet toy, popular in the late 1990s, was still a major craze in 2000",
            points: 1000,
            answer: "Tamagotchi",
            hint: "Pocket pets",
            path: "Year5.png",
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 151, 30),
      ),
      body: Container(
        color: const Color.fromARGB(255, 40, 151, 30),
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
