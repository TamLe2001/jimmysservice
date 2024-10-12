import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  TeamScreenState createState() => TeamScreenState();
}

class TeamScreenState extends State<TeamScreen> {
  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    void addPlayer() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Enter Player Name'),
            content: TextField(
              decoration: const InputDecoration(
                hintText: 'Player Name',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Closes the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Handle the input submission logic here
                  Navigator.of(context).pop(); // Closes the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

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
      body: Center(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => addPlayer(),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth() * 0.02,
                                vertical: screenHeight() * 0.001,
                              ),
                              child: Text(
                                "Players",
                                style: TextStyle(
                                  fontSize: screenWidth() * 0.016,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenHeight() * 0.23,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
