import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({super.key});

  @override
  State<LoginTest> createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('logintest1'),
    );
  }
}
