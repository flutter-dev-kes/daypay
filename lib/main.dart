import 'package:firebase_core/firebase_core.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResposinveLauout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignupScreen(),
    );
  }
}
