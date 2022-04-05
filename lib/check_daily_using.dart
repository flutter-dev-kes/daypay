import 'package:flutter/material.dart';

//一日に使える金額を事前に決めて円グラフでどれぐらいに達しているかを見れたりするとええな
class CheckDailyUsing extends StatelessWidget {
  //フォームの入力をイニシャライザ（多分コンストラクタ的なもの）で取得
  CheckDailyUsing(this.value);
  final value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('当日の使用金額確認ページ'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '本日の使用金額',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          //データベースからその日の使用金額を取得し、フォームからの入力情報に加算
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      )),
    );
  }
}
