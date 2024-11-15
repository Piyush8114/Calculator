import 'package:calculator/My_calculator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Calculator_Page extends StatefulWidget {
  Calculator_Page({super.key});

  @override
  State<Calculator_Page> createState() => _Calculator_PageState();
}

class _Calculator_PageState extends State<Calculator_Page> {

  String _output = "0";
  String _tempOutput = "0";
  String _operator = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _clear();
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      _operatorPressed(buttonText);
    } else if (buttonText == ".") {
      _decimalPressed(buttonText);
    } else if (buttonText == "=") {
      _equalsPressed();
    } else {
      _numberPressed(buttonText);
    }
  }

  void _clear() {
    setState(() {
      _output = "0";
      _tempOutput = "0";
      _operator = "";
      _num1 = 0.0;
      _num2 = 0.0;
    });
  }

  void _operatorPressed(String buttonText) {
    setState(() {
      _num1 = double.parse(_output);
      _operator = buttonText;
      _tempOutput = "0";
    });
  }

  void _decimalPressed(String buttonText) {
    if (!_tempOutput.contains(".")) {
      setState(() {
        _tempOutput += buttonText;
        _output = _tempOutput;
      });
    }
  }

  void _numberPressed(String buttonText) {
    setState(() {
      if (_tempOutput == "0") {
        _tempOutput = buttonText;
      } else {
        _tempOutput += buttonText;
      }
      _output = _tempOutput;
    });
  }

  void _equalsPressed() {
    setState(() {
      _num2 = double.parse(_output);
      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operator == "x") {
        _output = (_num1 * _num2).toString();
      } else if (_operator == "/") {
        _output = (_num1 / _num2).toString();
      }

      _num1 = 0.0;
      _num2 = 0.0;
      _operator = "";
      _tempOutput = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Calculator",style: TextStyle(color: Colors.white),),
        actions: [
          GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => My_Calculator(),));
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: My_Calculator(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward,color: Colors.white,),
              )),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildButtonRow("7", "8", "9", "/"),
                _buildButtonRow("4", "5", "6", "x"),
                _buildButtonRow("1", "2", "3", "-"),
                _buildButtonRow(".", "0", "00", "+"),
                _buildButtonRow("C", "=", "", ""),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildButtonRow(String a, String b, String c, String d) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButton(a),
          _buildButton(b),
          _buildButton(c),
          _buildButton(d),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        decoration:BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: (){
            _buttonPressed(text);
            },
            child: Text(text,style: TextStyle(fontSize: 23,color: Colors.white),)),
      )
    );
  }
}