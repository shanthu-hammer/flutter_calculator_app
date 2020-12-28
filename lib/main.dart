import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(
              children: [
                customOutlineButton('9'),
                customOutlineButton('8'),
                customOutlineButton('7'),
                customOutlineButton('+'),
              ],
            ),
            Row(
              children: [
                customOutlineButton('6'),
                customOutlineButton('5'),
                customOutlineButton('4'),
                customOutlineButton('-'),
              ],
            ),
            Row(
              children: [
                customOutlineButton('3'),
                customOutlineButton('2'),
                customOutlineButton('1'),
                customOutlineButton('X'),
              ],
            ),
            Row(
              children: [
                customOutlineButton('C'),
                customOutlineButton('0'),
                customOutlineButton('='),
                customOutlineButton('/'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(val),
        child: Expanded(
          child: Text(
            val,
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }

  int first, second;
  String res, text = '', opp;
  void btnClicked(String btnText) {
    if (btnText == 'C') {
      res = '';
      text = '';
      first = 0;
      second = 0;
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'X' ||
        btnText == '/') {
      first = int.parse(text);
      res = '';
      opp = btnText;
    } else if (btnText == '=') {
      second = int.parse(text);
      if (opp == '+') {
        res = (first + second).toString();
      } else if (opp == '-') {
        res = (first - second).toString();
      } else if (opp == 'X') {
        res = (first * second).toString();
      } else if (opp == '/') {
        res = (first ~/ second).toString();
      }
    } else {
      res = text + btnText;
    }
    setState(() {
      text = res;
    });
  }
}
