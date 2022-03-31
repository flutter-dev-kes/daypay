import 'package:flutter/material.dart';

class InputPay extends StatefulWidget {
  @override
  _InputPayState createState() => _InputPayState();
}

class _InputPayState extends State<InputPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DayPay'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '使用金',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
            ),
          ],
        ),
      ),
    );
  }
}
