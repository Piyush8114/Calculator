import 'package:calculator/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key});

  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  int result = 0;

   void _add() {
    setState(() {
      int Fvalue = int.parse(firstController.text);
      int Svalue = int.parse(secondController.text);
      result = Fvalue + Svalue;
    });
  }

  void _subtract() {
    setState(() {
      int Fvalue = int.parse(firstController.text);
      int Svalue = int.parse(secondController.text);
      result = Fvalue - Svalue;
    });
  }

  void _multiply() {
    setState(() {
      int Fvalue = int.parse(firstController.text);
      int Svalue = int.parse(secondController.text);
      result = Fvalue * Svalue;
    });
  }

  void _divide() {
    setState(() {
      int Fvalue = int.parse(firstController.text);
      int Svalue = int.parse(secondController.text);
      result = (Fvalue / Svalue).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Basic Calculator'),

        actions: [
          GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    alignment: Alignment.topCenter,
                    child: HomePage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: firstController,
                  decoration: InputDecoration(
                    hintText: "Enter first value",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: secondController,
                  decoration: InputDecoration(
                    hintText: "Enter second value",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  height: 50,
                  child: Text(
                    result.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 30,),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: _add, child: Text("+"))),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: _subtract, child: Text("-"))),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: _multiply, child: Text("x"))),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: _divide, child: Text("/"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
