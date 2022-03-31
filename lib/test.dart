import 'package:flutter/material.dart';
import 'input_pay.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('次へ'),
          onPressed: (){
            // 押したら反応するコードを書く
            // 画面遷移のコード
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputPay(),
                )
            );
          },
        ),
      ),
    );
  }
}
