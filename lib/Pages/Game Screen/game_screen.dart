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
            hint: "Martins daddys",
            path: "guesswho1.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 400,
            answer: "Sofie & Danny",
            hint: "En af dem starter med D og den anden slutter på E",
            path: "guesswho2.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 600,
            answer: "Casper & Johnny Sins",
            hint: "En af dem er astronaut, læge, mekaniker, lærer og skaldet",
            path: "guesswho3.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 800,
            answer: "Abdi & James Charles",
            hint: "En af dem er beauty influencer",
            path: "guesswho4.png",
          ),
          ImageQuestion(
            question: "Who am I?",
            points: 1000,
            answer: "Helene, Jeanete & Marie",
            hint: "Der er tre personer på billedet",
            path: "guesswho5.png",
          ),
        ],
      ),
      Category(
        category: "Gaming",
        questions: [
          ImageQuestion(
            question: "Hvad kom ud først? Warcraft eller RuneScape",
            points: 200,
            answer: "Runescape",
            hint: "Runescape kom ud JAN 2001",
            path: "games1.png",
          ),
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 400,
            answer: "Roblox Dress to Impress",
            hint: "YASSS SLAY QUEEN",
            path: "games2.mp3",
          ),
          ImageQuestion(
            question: "Hvilket spil kommer denne pengvin fra?",
            points: 600,
            answer: "VALORANT BREEZE",
            hint: "pew pew",
            path: "games3.png",
          ),
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 800,
            answer: "Pokemon Red Evolution",
            hint: "Red, Blue, Green, Yellow?",
            path: "games4.mp3",
          ),
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 1000,
            answer: "Super Mario Galaxy OP Theme",
            hint: "LetsAGo!",
            path: "games5.mp3",
          ),
        ],
      ),
      Category(
        category: "Christmas Songs",
        questions: [
          AudioQuestion(
            question: "What Christmas song is this?",
            points: 200,
            answer: "Santa tell me by Ariana Grande",
            hint: "Good luck",
            path: "santatellme.mp3",
          ),
          AudioQuestion(
            question: "What is the artist name?",
            points: 400,
            answer: "WHAM",
            hint: "BANG SLAM POW",
            path: "lastchristmas.mp3",
          ),
          AudioQuestion(
            question: "Guess the Lyrics (frem til omklædet)",
            points: 600,
            answer:
                "I don't wanna miss out on the holiday but I can't stop staring at your face I should be playing in the winter snow but I'ma be under the mistletoe",
            hint: "I don't wanna miss out on the holidays, but...",
            path: "mistletoe.mp3",
          ),
          AudioQuestion(
            question: "What Christmas song is this?",
            points: 800,
            answer: "Nu er det Jul",
            hint: "Hvad siger man på Jesus fødselsdag?",
            path: "nudetjul.mp3",
          ),
          AudioQuestion(
            question: "How old is the artist?",
            points: 1000,
            answer: "55",
            hint: "Hendes alder indeholder to af de samme tal",
            path: "alliwantforchristmas.mp3",
          ),
        ],
      ),
      Category(
        category: "Anime",
        questions: [
          AudioQuestion(
            question: "Guess the Anime",
            points: 200,
            answer: "Sword Art Online",
            hint: "kunst, sværd og videospil",
            path: "anime1.mp3",
          ),
          ImageQuestion(
            question: "Hvilken Hashira er hun?",
            points: 400,
            answer: "Insect Hashira",
            hint: "Gift er hendes speciale",
            path: "anime2.png",
          ),
          ImageQuestion(
            question: "Hvad hedder han?",
            points: 600,
            answer: "Shisui Uchiha",
            hint: "Han er en Uchiha",
            path: "anime3.png",
          ),
          ImageQuestion(
            question: "Hvad er THE BIG THREE?",
            points: 800,
            answer: "Naruto, One Piece og Bleach",
            hint: "One Piece, Naruto og ?",
            path: "anime4.png",
          ),
          ImageQuestion(
            question: "Who is the anime director?",
            points: 1000,
            answer: "Makoto Shinkai",
            hint: "Hans fornavn er Makoto",
            path: "anime5.png",
          ),
        ],
      ),
      Category(
        category: "2000's Nostalgia",
        questions: [
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 200,
            answer: "Skype Call",
            hint: "Discords far",
            path: "nostalgia1.mp3",
          ),
          ImageQuestion(
            question: "Hvad hedder den her Bayblade?",
            points: 400,
            answer: "Pegasus",
            hint: "Flyvende hest",
            path: "nostalgia2.png",
          ),
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 600,
            answer: "Playstation 2 Startup",
            hint: "Ikke Xbox",
            path: "nostalgia3.mp3",
          ),
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 800,
            answer: "Regular Show OP",
            hint: "Benson, Skips og Pops",
            path: "nostalgia4.mp3",
          ),
          AudioQuestion(
            question: "Hvor kommer denne lyd fra?",
            points: 1000,
            answer: "Super Smash Bros OP",
            hint: "Button Mashing 1v1v1v1",
            path: "nostalgia5.mp3",
          ),
        ],
      ),
      Category(
        category: "Korean Pop Culture",
        questions: [
          ImageQuestion(
            question:
                "What is the name of the girl who was kicked out of her group due to rumors of bullying?",
            points: 200,
            answer: "Kim Garam",
            hint: "Hendes efternavn er Kim",
            path: "kpop1.png",
          ),
          ImageQuestion(
            question: "Name all of EXO members",
            points: 400,
            answer:
                "Xiumin, Luhan, Kris, Suho, Lay, Baekhyun, Chen, Chanyeol, D.O., Tao, Kai and Sehun",
            hint: "Xiumin, Luhan, Kris, Suho, Lay, Chanyeol, Tao + 5",
            path: "kpop2.png",
          ),
          ImageQuestion(
            question:
                "What is the medical name of the popular nose-job surgery?",
            points: 600,
            answer: "rhinoscopy",
            hint: "Nærehorn",
            path: "kpop3.png",
          ),
          ImageQuestion(
            question: "What is the name of this K-pop group?",
            points: 800,
            answer: "B.A.P",
            hint: "3 bogstaver",
            path: "kpop4.png",
          ),
          AudioQuestion(
            question: "What is the name of this K-pop group?",
            points: 1000,
            answer: "H.O.T",
            hint: "FIRE",
            path: "kpop5.mp3",
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
