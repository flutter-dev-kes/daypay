import 'package:daypay/check_monthly_using.dart';
import 'package:daypay/resources/firestore_database_methods.dart';
import 'package:daypay/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'check_daily_using.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

// TextFieldで入力された値を格納するProvider変数
StateProvider<String> _payContentProvider = StateProvider((ref) => "");
StateProvider<String> _payAmountProvider = StateProvider((ref) => "0");

class InputPay extends HookConsumerWidget {
  const InputPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TextFieldで入力された値が格納されるContoller
    final TextEditingController _payContentController = TextEditingController();
    final TextEditingController _payAmountController = TextEditingController();

    void setValue() {
      print('pass');
      ref.read(_payContentProvider.state).state = _payContentController.text;
      ref.read(_payAmountProvider.state).state = _payAmountController.text;
      print(ref.read(_payContentProvider.state).state);
      print(ref.read(_payAmountProvider.state).state);
      // validation処理
      // DB保存処理
      // 別ページ遷移処理
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return CheckMonthlyUsing();
          },
        ),
      );
    }

    void setPay() async {
      // ボタン押下不可に変更

      // 登録処理
      String res = await FirestoreDatabaseMethods().setPay(
        content: _payContentController.text,
        amount: _payAmountController.text,
      );

      print('res');
      print(res);

      // ボタン押下可能に変更

      // 成功だった場合の処理
      // 失敗だった場合の処理
      // if (res != 'success') {
      //   showSnackBar(res, context);
      // }
    }

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
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.teal,
              ),
              child: Column(
                children: [
                  const Text(
                    '使用金額',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 240, 229, 146),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _payContentController,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '支払い内容',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _payAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '使用金額',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: setPay,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 175, 231, 226),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.currency_yen),
                    Text('submit'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
