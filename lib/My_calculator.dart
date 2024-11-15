import 'dart:core';
import 'package:calculator/Basic_Calculator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class My_Calculator extends StatefulWidget {
  My_Calculator({super.key});

  @override
  State<My_Calculator> createState() => _My_CalculatorState();
}

class _My_CalculatorState extends State<My_Calculator> {
  String equation = '0';
  String result = '0';
  late int A,B;

  buttonPressed(btnText)
  {
    if(btnText == 'Ac')
      {
        equation = '0';
        result = '0';
      }
    else if(btnText == "+")
      {

      }
  }
  
  Widget callBtn(String btnText, Color txtcolor , double width, Color bgcolor)
  {
    return InkWell(
      onTap: (){

      },
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: width,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadiusDirectional.circular(80),
        ),
        child: Text(btnText, style: TextStyle(color: txtcolor,fontWeight: FontWeight.w500,fontSize: 30),),
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
                // Navigator.push(context, MaterialPageRoute(builder: (context) => BasicCalculator(),));
                Navigator.push(
                  context,
                  PageTransition(
                    alignment: Alignment.bottomCenter,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 600),
                    reverseDuration: Duration(milliseconds: 600),
                    type: PageTransitionType.rightToLeftPop,
                    child: BasicCalculator(),
                    childCurrent: My_Calculator(),
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
            child: SingleChildScrollView(child: Text("0",style: TextStyle(fontSize: 30,color: Colors.orangeAccent[100]),)),
          ),

          SizedBox(height: 20,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 80,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(child: Text("0",style: TextStyle(fontSize: 60,color: Colors.white),)),
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
