import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_project/components/rounded_button.dart';
import 'package:green_project/components/rounded_input_field.dart';
import 'package:green_project/components/rounded_password_field.dart';
import 'package:green_project/constants.dart';
import 'package:green_project/screens/App/app_screen.dart';
import 'package:green_project/screens/login/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            width: size.width * 0.15,
            height: size.height * 0.15,
            child: Image.asset("assets/icons/logo_white.png"),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'GREEN TECH',
              style: GoogleFonts.roboto(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            'Bienvenido,',
            textAlign: TextAlign.center,
            style: GoogleFonts.francoisOne(fontSize: 25, color: Colors.white),
          ),
          Text(
            'Por favor, inicie sesión para continuar.',
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          RoundedInputField(
            controller: emailController,
            hintText: 'Correo electrónico',
            icon: Icons.person,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            controller: passwordController,
            onChanged: (value) {},
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          RoundedButton(
            text: 'Entrar',
            color: threeColor,
            textColor: Colors.black,
            icon: Icons.login,
            colorIcon: Colors.black,
            press: () {
              _signInWithEmailAndPassword(context);
            },
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Icon(
                BootstrapIcons.person_bounding_box,
                color: fourColor,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User user = userCredential.user!;
      print('Usuario autenticado: ${user.email}');

      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) {
            return const AppScreen();
          },
        ),
      );
    } catch (e) {
      print('Error al iniciar sesión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error al iniciar sesión. Por favor, verifica tus credenciales.',
          ),
        ),
      );
    }
  }
}
