
import 'package:circlet/firebase/firebase_test.dart';
import 'package:circlet/screen/cafe/cafe_main.dart';
import 'package:circlet/screen/login_register/Interest_page.dart';
import 'package:circlet/screen/login_register/add_github_page.dart';
import 'package:circlet/screen/login_register/add_portfolio_page.dart';
import 'package:circlet/screen/login_register/login/login_page.dart';
import 'package:circlet/screen/login_register/id_password_search/password_reset_page.dart';
import 'package:circlet/screen/login_register/register/phone_auth.dart';
import 'package:circlet/screen/login_register/register/register_page.dart';
import 'package:circlet/screen/login_register/tech_stack_page.dart';
import 'package:circlet/screen/main/bottom_navigator.dart';
import 'package:circlet/screen/profile/setting/profile_setting_page.dart';
import 'package:circlet/screen/study/create/study_create.dart';
import 'package:circlet/screen/study/create/study_interest.dart';
import 'package:circlet/screen/study/schedule/add_schedule.dart';
import 'package:circlet/screen/study/schedule/show_schedule.dart';
import 'package:firebase_core/firebase_core.dart';
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
        useMaterial3: true,
      ),
      home: PhoneAuth(),
    );
  }
}
