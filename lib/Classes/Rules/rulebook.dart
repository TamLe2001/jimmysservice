import 'package:flutter/material.dart';

class RuleBook extends StatelessWidget {
  final List<String> rules;

  const RuleBook({
    super.key,
    required this.rules,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "${index + 1}.  ${rules[index]}",
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
