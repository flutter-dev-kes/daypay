import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:daypay/responsive/mobile_screen_layout.dart';
import 'package:daypay/responsive/responsive_layout_screen.dart';
import 'package:daypay/responsive/web_screen_layout.dart';
import 'package:daypay/screens/login_screen.dart';
import 'package:daypay/screens/signup_screen.dart';
import 'package:daypay/screens/home_screen.dart';
import 'package:daypay/utils/colors.dart';
import 'package:daypay/widgets/text_field_input.dart';

import 'package:flutter/material.dart';

// 値（ここでは "Hello world"）を格納する「プロバイダ」を作成します。
// プロバイダを使うことで値のモックやオーバーライドが可能になります。
final helloWorldProvider = Provider((_) => 'Hello world');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBLFlHzaKB-w8dPhBqETOgLabqs9Q_bxdk',
        appId: '1:462221713281:ios:62085501387fb7d5b25280',
        messagingSenderId: '462221713281',
        projectId: 'daypay-34036',
        storageBucket: 'daypay-34036.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  print('start');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // `ref.watch` を使用して Providerを読み取ります。
    final String value = ref.watch(helloWorldProvider);
    // `HookConsumerWidget` を継承しているので `useXxx` メソッドが使用できる。
    final counter = useState(0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResposinveLauout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: Text(value),
    );
  }
}
