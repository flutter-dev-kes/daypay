import 'package:daypay/test.dart';
import 'package:flutter/material.dart';
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
            return Test();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('DayPay'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '使用金額',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
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
              height: 20,
            ),
            TextField(
              controller: _payAmountController,
              // controller:
              //     TextEditingController(text: ref.watch(_stateProvider)),
              keyboardType: TextInputType.number,
              autofocus: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '使用金額',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('登録'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                elevation: 16,
              ),
              onPressed: () => setValue(),
            ),
            // 以下でRiverpodに格納されている情報を出力する。
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text('${ref.watch(_payContentProvider)}'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Text('${ref.watch(_payAmountProvider)}'),
            ),
          ],
        ),
      ),
    );
  }
}
