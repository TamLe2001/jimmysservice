import 'package:flutter/material.dart';

class RuleBook extends StatefulWidget {
  final List<String> rules;

  const RuleBook({
    super.key,
    required this.rules,
  });

  @override
  RuleBookState createState() => RuleBookState();
}

class RuleBookState extends State<RuleBook> {
  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.rules.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            "${index + 1}.  ${widget.rules[index]}",
            style: TextStyle(
              fontSize: screenWidth() * 0.016,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
