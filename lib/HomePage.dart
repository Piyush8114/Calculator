import 'package:calculator/gridview_calculator.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';

// Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        title: new Text("Calculator"),

        actions: [
          GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator_Page(),));
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child:GridviewCalculator(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward,color: Colors.black,),
              ))
        ],
      ), //AppBar
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }

                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }

                    // other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

// ------------------------------------------------------------------------------------------------------------
class MyButton extends StatelessWidget {

// declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

//Constructor
  MyButton({this.color, this.textColor, required this.buttonText, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
