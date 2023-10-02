import 'package:flutter/material.dart';
import 'package:green_project/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // importante!
        body: Body(),
      ),
    );
  }
}
