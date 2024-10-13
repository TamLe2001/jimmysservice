import 'package:flutter/material.dart';
import 'package:jimmysservice/Pages/Team%20Screen/team_functions.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  TeamScreenState createState() => TeamScreenState();
}

class TeamScreenState extends State<TeamScreen> {
  late TeamFunctions teamFunctions;

  @override
  void initState() {
    super.initState();
    teamFunctions = TeamFunctions(context: context);
  }

  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text(
          "Team Creation",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: teamFunctions.playerLength,
        builder: (context, value, child) {
          return Center(
            child: Column(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.red,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: screenWidth() * 0.2,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: teamFunctions.addPlayer(),
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth() * 0.02,
                            vertical: screenHeight() * 0.001,
                          ),
                          child: Text(
                            "Players: $value",
                            style: TextStyle(
                              fontSize: screenWidth() * 0.016,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screenHeight() * 0.23,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: teamFunctions.listBuilder(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
