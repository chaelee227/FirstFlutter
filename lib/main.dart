
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{ //technically, widget can be recreated itself
  //but the state is persistent

  State<StatefulWidget> createState() { //return state object
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> { //state is generic class, this state belongs to myapp
  final _questions =  const [ //questions is list of map
    {'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text' : 'Black', 'score': 10},
        {'text' : 'Red'  , 'score': 5},
        {'text' : 'Green', 'score': 3},
        {'text' : 'White', 'score': 1},
      ],
    }, //Key:value
    {'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text' : 'Rabbit', 'score': 1},
        {'text' : 'Snake' , 'score': 1},
        {'text' : 'Cat'   , 'score': 1},
        {'text' : 'Dog'   , 'score': 1},
      ],
    },
    {'questionText': 'who\'s your favorite instrutor?',
      'answers': [
        {'text' : 'Max'  , 'score': 1},
        {'text' : 'Jhon' , 'score': 1},
        {'text' : 'James', 'score': 1},
        {'text' : 'Jim'  , 'score': 1},
      ],
    },
  ];

  var _totalScore = 0;
  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print ('No more questions!');
    }

  }

  @override
  Widget build(BuildContext context ) {

/*
    var dummy = const ['Hello'];
    dummy.add('Max');
    print(dummy);
    //questons = [];//does not work if questons is a const
 */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}