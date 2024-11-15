import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class GridviewCalculator extends StatefulWidget {
  const GridviewCalculator({super.key});

  @override
  State<GridviewCalculator> createState() => _GridviewCalculatorState();
}

class _GridviewCalculatorState extends State<GridviewCalculator> {

  String userinput = '';
  String result = '0';

  final List<String> buttonlist = [
    '⌫', '(', ')', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '+',
    '1', '2', '3', '-',
    'Ac', '0', '.', '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: resultwidget()),
            Flexible(
                flex: 2,
                child: buttonwidget()),
          ],
        ),
      ),
    );
  }
    
    Widget resultwidget()
    {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(userinput,style: TextStyle(fontSize: 32),),
          ),

          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(result,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          ),
        ],
      );
    }

    Widget buttonwidget()
    {
      return Container(
        child: GridView.builder(
          itemCount: buttonlist.length,
          itemBuilder: (context, index) {
            return button(buttonlist[index]);

          },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)),
      );
    }

    Widget button(String text)
    {
      return Container(
        margin: EdgeInsets.all(8),
        child: MaterialButton(
            color: getColor(text),
            textColor: Colors.white,
            onPressed: ()
            {
              setState(() {
                handelButtonPress(text);
              });
            },
        child: Text(text,style: TextStyle(fontSize: 25),),
          shape: CircleBorder()
        ),
      );
    }

    handelButtonPress(String text)
    {
      if (text == "Ac")
        {
          userinput = "";
          result = "0";
          return;
        }
     else if (text == "⌫")
      {
        userinput = userinput.substring(0, userinput.length -1);
        return;
      }
     else if(text == "=")
       {
         result = calculate();
         if(result.endsWith(".0"))
           {
             result  = result.replaceAll(".0", "");
           }
       }

      userinput = userinput + text;
    }

    String calculate(){
    try{
      var exp = Parser().parse(userinput);
      var evaulation = exp.evaluate(EvaluationType.REAL,ContextModel());
      return evaulation.toString();
    }
    catch(e)
      {
        return "Error";
      }
    }


    getColor(String text)
    {
      if(text == "-" || text == "/" || text == "*" || text == "+"|| text == "=" )
        {
          return Colors.orangeAccent;
        }
      else if(text == "⌫" || text == "Ac")
      {
        return Colors.red;
      }
      else if(text == "(" || text == ")")
      {
        return Colors.blueGrey;
      }
      return Colors.blue;

    }
    
  }

