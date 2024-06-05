import 'package:circlet/screen/login_register/add_portfolio_page.dart';
import 'package:circlet/screen/login_register/login/login_page.dart';
import 'package:circlet/screen/login_register/register/phone_auth.dart';
import 'package:circlet/screen/login_register/register/register_page.dart';
import 'package:circlet/screen/login_register/tech_stack_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:circlet/screen/study/study_home/study_search_page.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
