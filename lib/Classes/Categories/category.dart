import 'package:flutter/material.dart';
import 'package:jimmysservice/Classes/Categories/question.dart';

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
      child: Column(
        children: [
          Text(category),
          ...questions,
        ],
      ),
    );
  }
}
