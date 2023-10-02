import 'package:flutter/material.dart';
import 'package:green_project/constants.dart';
import 'package:green_project/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyC2Eh_zh8hi0HpO6BFhnC85Wv9c8BWvk_U',
    appId: '1:168279868294:android:3d9593e9f5641f15292207',
    messagingSenderId: '168279868294',
    projectId: 'greentech-ffd28',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Tech Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
    );
  }
}
