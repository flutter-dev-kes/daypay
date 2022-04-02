import 'dart:typed_data';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:daypay/resources/auth_methods.dart';
import 'package:daypay/utils/colors.dart';
import 'package:daypay/utils/utils.dart';
import 'package:daypay/widgets/text_field_input.dart';

/*
*  ここでは色々お試しで書いてみました！
*  主に書いたこと：Riverpod、Firebaseからの値取得、StreamBuilder（リアルタイム値監視）
*/

// 以下はRiverpodの書き方
// ここの~Providerと書いておくことで、その値をページ内で取得・参照することができる。
// Riverpodでの値取得は同じgit branchのmain.dartに動きなど書いてある。
// final counterProvider = StateProvider((ref) => 0);
// final usersProvider = StateProvider((ref) => getMessages());

class TestScreen extends HookConsumerWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 以下はFirebaseの値取得①
    // 最も一般的な取得方法は以下の通り。
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _firestore.collection('users').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        /// usersコレクションのドキュメントIDを取得する
        print('doc.id:${doc.id}');

        // 取得したドキュメントIDのフィールド値nameの値を取得する
        print(doc.get('username'));
      });
    });

    // 以下はFirebaseでの値取得②（リアルタイム）
    // StreamBuilderを使ってリアルタイムで値を変更させている。
    // 参考：https://zenn.dev/ymktmk/articles/be9a8b209daf3a#streambuilder%E3%82%92%E4%BD%BF%E3%81%86
    // ちなみにリアルタイムでの監視の仕方はおそらくだがuseStream（Flutter_fooks）を使う方法もありそう。
    // 参考：https://qiita.com/mkosuke/items/f88419d0f4d41ed6d858#usefuture--usestream
    return StreamBuilder<DocumentSnapshot>(
        stream: _firestore
            .collection('users')
            .doc('bdQzWo1lfxRgKRLTAgCS9EVu1bA2')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            print('snapshot data:${snapshot.data}');
            print('snapshot username:${snapshot.data!['username']}');
            return Text(snapshot.data!['username']);
          } else {
            return Container();
          }
        });
  }
}
