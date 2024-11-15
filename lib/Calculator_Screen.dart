import 'dart:core';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:page_transition/page_transition.dart';

import 'calculatorPage.dart';

class CalculatorScreen extends StatefulWidget {
   CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = '0';
  String result = '0';
  String expression = '';


  buttonPressed(btnText)
  {
    setState(() {
      if(btnText == 'Ac')
        {
          equation = '0';
          result = '0';
        }
      else if(btnText == '⌫')
        {
          if(equation == '')
            {
              equation = '0';
            }
         equation = equation.substring(0, equation.length - 1);
        }

      else if(btnText == '=')
      {
        expression = equation;
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('x', '*');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }
        catch(e)
      {
        "Error";
      }
      }

      else{
        if(equation == '0')
          {
            equation = btnText;
          }
        else
        equation = equation + btnText;
      }
    });
  }


  Widget callBtn(String btnText, Color txtcolor , double width, Color bgcolor )
  {
    return InkWell(
      onTap: (){
        buttonPressed(btnText);
      },
      child: Container(
        alignment: FractionalOffset.center,
        height: 70,
        width: width,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadiusDirectional.circular(80),
        ),
        child: Text(btnText,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: txtcolor),),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Calculator",style: TextStyle(color: Colors.white),),

        actions: [
          GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator_Page(),));
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: Calculator_Page(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward,color: Colors.white,),
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 80,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(child: Text(equation,style: TextStyle(fontSize: 30,color: Colors.orangeAccent[100]),)),
          ),

          SizedBox(height: 20,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 80,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(child: Text(result,style: TextStyle(fontSize: 60,color: Colors.white),)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callBtn("Ac", Colors.white, 70, Colors.orangeAccent[100]!),
                    callBtn("⌫", Colors.white, 70, Colors.white38!),
                    callBtn("%", Colors.white, 70, Colors.white38!),
                    callBtn("÷", Colors.white, 70, Colors.orangeAccent[100]!),
                  ],
                ),
                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callBtn("7", Colors.white, 70, Colors.white24!),
                    callBtn("8", Colors.white, 70, Colors.white24!),
                    callBtn("9", Colors.white, 70, Colors.white24!),
                    callBtn("x", Colors.white, 70, Colors.orangeAccent[100]!),
                  ],
                ),
                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callBtn("4", Colors.white, 70, Colors.white24!),
                    callBtn("5", Colors.white, 70, Colors.white24!),
                    callBtn("6", Colors.white, 70, Colors.white24!),
                    callBtn("-", Colors.white, 70, Colors.orangeAccent[100]!),
                  ],
                ),
                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callBtn("1", Colors.white, 70, Colors.white24!),
                    callBtn("2", Colors.white, 70, Colors.white24!),
                    callBtn("3", Colors.white, 70, Colors.white24!),
                    callBtn("+", Colors.white, 70, Colors.orangeAccent[100]!),
                  ],
                ),
                SizedBox(height: 25,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callBtn("0", Colors.white, 150, Colors.white24!),
                    callBtn(".", Colors.white, 70, Colors.white24!),
                    callBtn("=", Colors.white, 70, Colors.orangeAccent[100]!),
                  ],
                ),
                SizedBox(height: 25,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
