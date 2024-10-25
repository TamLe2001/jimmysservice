import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';
import 'package:jimmysservice/Classes/Settings/Screen/screen_functions.dart';

class Category extends StatelessWidget {
  final String category;
  final List<Question> questions;

  const Category({
    required this.category,
    required this.questions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              category,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                      ScreenFunctions(context: context).screenHeight() * 0.025),
            ),
            ...questions,
          ],
        ),
      ),
    );
  }
}
