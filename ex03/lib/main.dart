import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(Calculatrice());
}

class Calculatrice extends StatelessWidget {
  @override 
  Widget build (BuildContext context) {
    return MaterialApp(
      title: "Caculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "0";

  ButtonPressed(String strButton) {
    print(strButton);
    setState(() {
      if(strButton == "AC"){
        equation = "0";
        result = "0";
      }
      else if (strButton == "C"){
        equation = equation.substring(0, equation.length-1);
        if(equation.isEmpty){
          equation = "0";
        }
      }
      else if(strButton == "="){
        // Later
        expression = equation.replaceAll("÷", "/");
        expression = expression.replaceAll("×", "*");
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        }
        catch(e){
          result = "Syntax error";
          print(e);
        }

      }
      else {
        if(equation == "0"){
          equation = strButton;
        }
        else{
          equation = equation + strButton;
        }
      }  
    });
  }
  Widget CalculatorButton(String strButton, Color ColorText, Color ColorButton){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: ColorButton,
      child: MaterialButton(
        onPressed: () => ButtonPressed(strButton),
        padding: EdgeInsets.all(16),
        child: Text(strButton, style: TextStyle(color: ColorText, fontSize: 30, fontWeight: FontWeight.normal),),),
    );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: 35),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
            child: Text(result, style: TextStyle(fontSize: 35),),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child : Table(
                  children: [
                    TableRow(
                      children: [
                        CalculatorButton("AC", Colors.red, Colors.white),
                        CalculatorButton("C", Colors.red, Colors.white),
                        CalculatorButton("%", Colors.blue, Colors.white),
                        CalculatorButton("÷", Colors.blue, Colors.white),
                      ]
                    ),
                    TableRow(
                      children: [
                        CalculatorButton("7", Colors.blue, Colors.white),
                        CalculatorButton("8", Colors.blue, Colors.white),
                        CalculatorButton("9", Colors.blue, Colors.white),
                        CalculatorButton("×", Colors.blue, Colors.white),
                      ]
                    ),
                    TableRow(
                      children: [
                        CalculatorButton("4", Colors.blue, Colors.white),
                        CalculatorButton("5", Colors.blue, Colors.white),
                        CalculatorButton("6", Colors.blue, Colors.white),
                        CalculatorButton("-", Colors.blue, Colors.white),
                      ]
                    ),
                    TableRow(
                      children: [
                        CalculatorButton("1", Colors.blue, Colors.white),
                        CalculatorButton("2", Colors.blue, Colors.white),
                        CalculatorButton("3", Colors.blue, Colors.white),
                        CalculatorButton("+", Colors.blue, Colors.white),
                      ]
                    ),
                    TableRow(
                      children: [
                        CalculatorButton(".", Colors.blue, Colors.white),
                        CalculatorButton("0", Colors.blue, Colors.white),
                        CalculatorButton("00", Colors.blue, Colors.white),
                        CalculatorButton("=", Colors.white, Colors.blue),
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}