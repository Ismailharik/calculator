import 'package:flutter/material.dart';

void main() => runApp(MyCalculator());

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: ' ',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String text = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '0';
  String finalResult = '0';
  String opr = '';
  String preOpr = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ))
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    fctbutton("C", Color(0xffa5a5a5), 1),
                    fctbutton("+/-", Color.fromRGBO(156, 156, 156, 1), 1),
                    fctbutton("%", Color(0xffa5a5a5), 1),
                    fctbutton("/", Color(0xffff9800), 1),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  fctbutton("7", Color(0xff323232), 1),
                  fctbutton("8", Color(0xff323232), 1),
                  fctbutton("9", Color(0xff323232), 1),
                  fctbutton("x", Color(0xffff9800), 1),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    fctbutton("4", Color(0xff323232), 1),
                    fctbutton("5", Color(0xff323232), 1),
                    fctbutton("6", Color(0xff323232), 1),
                    fctbutton("-", Color(0xffff9800), 1),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    fctbutton("1", Color(0xff323232), 1),
                    fctbutton("2", Color(0xff323232), 1),
                    fctbutton("3", Color(0xff323232), 1),
                    fctbutton("+", Color(0xffff9800), 1),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    fctbutton("0", Color(0xff323232), 0),
                    fctbutton(".", Color(0xff323232), 1),
                    fctbutton("=", Color(0xffa5a5a5), 1),
                  ]),
            ],
          )),
    );
  }

  Widget fctbutton(String str, Color color, int num) {
    Container container;
    if (num == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculate(str);
          },
          child: Text(
            str,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          color: color,
          padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
          shape: StadiumBorder(),
        ),
      );
    } else {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculate(str);
          },
          child: Text(str,
              style: TextStyle(
                fontSize: 30,
              )),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    }
    return container;
  }

  void calculate(txtBtn) {
    if (txtBtn == 'C') {
      text = '0';
      numOne = numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (txtBtn == '+' ||
        txtBtn == '-' ||
        txtBtn == '%' ||
        txtBtn == '=' ||
        txtBtn == 'x' ||
        txtBtn == '/' ||
        txtBtn =='+/-') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      switch (opr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case '/':
          finalResult = div();
          break;
        case 'x':
          finalResult = mul();
          break;
        case '%':
          finalResult = mod();
          break;
        case '+/-':
          finalResult = switching();
      }
      preOpr = opr;
      opr = txtBtn;
      result = '';
    } else {
      if (result == '0') {
        result = '';
      }
      if (result == '.') {
        if (result.contains('.')) {
          result += '.';
        }
      }
      result = result + txtBtn;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  //Les Fonctions des Operations
  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }

  String mod() {
    result = (numOne % numTwo).toString();
    numOne = double.parse(result);
    return decimalRemove(result);
  }
  String switching (){
    if(result.contains('-')){
      return result.replaceAll("-", "");
    }
    return result = '-'+result;
  }

  // Fin des Fonctions des Operations

  // Removing 0 from the decimal for exemple 1.0
  String decimalRemove(String _result) {
    if (_result.contains('.')) {
      List<String> split = _result.split('.');
      if (int.parse(split[1]) == 0) {
        return split[0];
      }
    }
    return _result;
  }
}
