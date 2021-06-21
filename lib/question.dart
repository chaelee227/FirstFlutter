import 'package:flutter/material.dart';


class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container( //Container takes full width of the screen
      width: double.infinity,
      margin: EdgeInsets.all(10), //is spacing around the container
      // little bit spacing around the container
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
