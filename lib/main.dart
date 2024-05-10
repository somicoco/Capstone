
import 'package:circlet/firebase/firebase_test.dart';
import 'package:circlet/screen/login_register/Interest_page.dart';
import 'package:circlet/screen/login_register/add_github_page.dart';
import 'package:circlet/screen/login_register/add_portfolio_page.dart';
import 'package:circlet/screen/login_register/login/login_page.dart';
import 'package:circlet/screen/login_register/id_password_search/password_reset_page.dart';
import 'package:circlet/screen/login_register/register/register_page2.dart';
import 'package:circlet/screen/login_register/tech_stack_page.dart';
import 'package:circlet/screen/lounge/lounge_page.dart';
import 'package:circlet/screen/post/post_create_page.dart';
import 'package:circlet/screen/post/post_view_page.dart';
import 'package:circlet/screen/profile/setting/profile_setting_page.dart';
import 'package:circlet/screen/profile/user/user_profile_page.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  print('-- main: Firebase.initializeApp');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoungePage(),
    );
  }
}
