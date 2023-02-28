

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _temp = "0";
  String _operation = "0";

  void _clear() {
    setState(() {
      _output = "0";
      _temp = "0";
      _operation = "0";
    });
  }

  void _calculate() {
    double num1 = double.parse(_output);
    double num2 = double.parse(_temp);

    if (_operation == "+") {
      setState(() {
        _output = (num1 + num2).toString();
        _temp = "0";
        _operation = "0";
      });
    }
    if (_operation == "-") {
      setState(() {
        _output = (num1 - num2).toString();
        _temp = "0";
        _operation = "0";
      });
    }
    if (_operation == "x") {
      setState(() {
        _output = (num1 * num2).toString();
        _temp = "0";
        _operation = "0";
      });
    }
    if (_operation == "/") {
      setState(() {
        _output = (num1 / num2).toString();
        _temp = "0";
        _operation = "0";
      });
    }
  }

  void _addToOutput(String value) {
    if (_operation == "0") {
setState(() {
  if (_output == "0") {
    _output = value;
  } else {
    _output = _output + value;
  }
});
    } else {
setState(() {
  if (_temp == "0") {
    _temp = value;
  } else {
    _temp = _temp + value;
  }
});
    }
  }

  void _setOperation(String value) {
    setState(() {
      _operation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  child: Text("AC"),
                  onPressed: () {
                    _clear();
                  },
                ),
                ElevatedButton(
                  child: Icon(Icons.backspace),
                  onPressed: () {
                    setState() {
                      if (_operation == null) {
                        if (_output.length > 1) {
                          _output = _output.substring(0, _output.length - 1);
                        } else {
                          _output = "0";
                        }
                      } else {
                        if (_temp.length > 1) {
                          _temp = _temp.substring(0, _temp.length - 1);
                        } else {
                          _temp = "0";
                        }
                    }
                  }
                  },
                ),
                ElevatedButton(
                  child: Text("="),
                  onPressed: () {
                    _calculate();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperation("+");
                    _addToOutput("+");
                  },
                  child: Text("+"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("7");
                  },
                  child: Text("7"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("8");
                  },
                  child: Text("8"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("9");
                  },
                  child: Text("9"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperation("/");
                  _addToOutput("/");
                    },
                  child: Text("/"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("4");
                  },
                  child: Text("4"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("5");
                  },
                  child: Text("5"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("6");
                  },
                  child: Text("6"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperation("x");
                    _addToOutput("x");
                  },
                  child: Text("x"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("1");
                  },
                  child: Text("1"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("2");
                  },
                  child: Text("2"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _addToOutput("3");
                  },
                  child: Text("3"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _setOperation("-");
                    _addToOutput("-");
                  },
                  child: Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}