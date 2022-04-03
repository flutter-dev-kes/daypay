import 'package:daypay/check_monthly_using.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'check_daily_using.dart';
import 'package:flutter/src/material/icons.dart';

class InputPay extends StatelessWidget {
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DayPay'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CheckMonthlyUsing()));
              },
              icon: Icon(Icons.calendar_month))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.teal,
                ),
                child: Column(
                  children: [
                    Text(
                      '使用金額',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 240, 229, 146),
                      ),
                    ),
                    TextField(
                      controller: valueController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly // ③ 数字入力のみ許可する
                      ],
                      autofocus: true,
                    )
                  ],
                )),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CheckDailyUsing(valueController.text)));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 175, 231, 226),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.currency_yen), Text('submit')]),
                )),
          ],
        ),
      ),
    );
  }
}
