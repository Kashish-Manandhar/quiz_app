import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var quiz_question = [
    {
      "question": "Monica briefly dates billionaire Pete Becker. Which country does he take her for their first date?",
      "options": ["France", "Italy", "England", "Greece"],
      "answer": "Italy"
    },
    {
      "question": "Of all ten ‘Friends’ seasons, which season did *not* feature a Thanksgiving episode?",
      "options": ["Season 2","Season 3","Season 4","Season 5"],
      "answer": "Season 2"
    },
    {
      "question": "How many categories of towels does Monica have?",
      "options": ["10","12","9","11"],
      "answer": "11"
    },
    {
      "question": "What is the name of Rachel’s hairless cat?",
      "options": ["Fluffy","Miss Kitty","Mrs Whiskerson"],
      "answer": "Mrs Whiskerson"
    },
    {
      "question": "How many babies are born during the show’s ten seasons?",
      "options": ["2","4","7","8"],
      "answer": "7"
    },
    {
      "question": "What was Rachel’s childhood dog called? ",
      "options": ["LaPoo", "ChiChi", "Bo-Bo", "Buster"],
      "answer": "LaPoo"
    },
    {
      "question": "Where did Chandler say he was moving in order to break up with Janice?",
      "options": ["London","Yemen","France","Italy"],
      "answer": "Yemen"
    },
    {
      "question": "How many long-stemmed roses does Ross send to Emily?",
      "options": ["50","100","72","64"],
      "answer": "72"
    },  {
      "question": "What is Phoebe’s ex-husband’s name?",
      "options": ["Duncan","Kyle","Tyler","Vince"],
      "answer": "Duncan"
    },  {
      "question": "Who was Monica’s midnight mystery kisser?",
      "options": ["Ross","Chandler","Chip Mathhews","Joey"],
      "answer": "Ross"
    },
    {
      "question": "Who co-founded the “I Hate Rachel Green Club” with Ross?",
      "options": ["Billy Trate","Chandler","Will Colbert","Sean McCann"],
      "answer": "Will Colbert"
    },
    {
      "question": "How many sisters does Joey have?",
      "options": ["5","6","7","8"],
      "answer": "7"
    },
    {
      "question": "What hangs on Monica's purple door?",
      "options": ["A key hook","A coat hook" ,"A Gold Frame","A cap"],
      "answer": "A Gold Frame"
    },
    {
      "question": "Rachel writes Ross a letter in “The One with the Jellyfish”. How many pages long is it?",
      "options": ["12","15","18","15"],
      "answer": "18"
    },
    {
      "question": "During the complete run of Friends, how many times does Ross get married and eventually divorced?",
      "options": ["2","3","4","5"],
      "answer": "3"
    },
    {
      "question": "In which city is Friends set?",
      "options": ["LA","New York","Chicago","Seattle"],
      "answer": "NewYork"
    }
  ];


  int _index = 0;
  int score=0;

  Widget createButton(String options) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10,right: 10,top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.cyan
      ),
      child: FlatButton(
        color: Colors.transparent,

        child: Text(options,style: TextStyle(color: Colors.white,
         fontWeight: FontWeight.bold,
        fontSize: 19)),
        onPressed: () {
          print("$options was clicked");
          if (options == quiz_question[_index]['answer']) {
            print("True");
            score++;
          } else {
            print("False");
          }

          setState(() {
            _index++;
            print(_index);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    int no= quiz_question.length;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body:Center(
        child: (_index<quiz_question.length) ? Column(
            mainAxisAlignment:MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text(quiz_question[_index]['question'],style: TextStyle(color: Colors.amber,fontSize: 24),textAlign: TextAlign.center,),
          ...(quiz_question[_index]['options'] as List<String>)
              .map((options) => createButton(options))
              .toList(),
        ])
            :
        Text("Congratulations ,\n You have scored  $score / $no",
        style: TextStyle(
          color: Colors.red,
          fontSize: 24,
          fontWeight: FontWeight.w700,

        ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }
}
