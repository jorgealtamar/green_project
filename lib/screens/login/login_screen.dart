import 'package:flutter/material.dart';
import 'package:myapp/screens/login/components/body.dart';


class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';
  
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // importante!
        body: Body(),
      ),
    );
  }
}

