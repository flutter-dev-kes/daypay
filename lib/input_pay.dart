import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPay extends StatelessWidget {
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
              '使用金額',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly // ③ 数字入力のみ許可する
              ],
              autofocus: true,
            ),
            ElevatedButton(
              child: const Text('今日使った金額へ'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                print('今日使った金額へ遷移');
              },
            ),
          ],
        ),
      ),
    );
  }
}
