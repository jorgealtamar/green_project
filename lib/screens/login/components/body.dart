import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/components/rounded_button.dart';
import 'package:myapp/components/rounded_input_field.dart';
import 'package:myapp/components/rounded_password_field.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/login/components/background.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/services/auth_state.dart';


class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  AuthState authState = AuthState.Initial;

  signInWithEmailAndPassword() async {
    setState(() {
      authState = AuthState.Loading;
    });

    try {
      await Auth().signInWithEmailAndPassword(_email.text, _password.text);
      setState(() {
        authState = AuthState.Success;
      });
      // ignore: use_build_context_synchronously
      context.push('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        setState(() {
          authState = AuthState.Failure;
        });
        // ignore: use_build_context_synchronously
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Opps!',
              message: 'El correo electrónico o contraseña son incorrectos.',
              contentType: ContentType.failure,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

     Widget buildLoginButton() {
      if (authState == AuthState.Loading) {
        return const CircularProgressIndicator(); // Muestra un indicador de carga.
      } else {
        return RoundedButton(
          text: 'Entrar',
          color: threeColor,
          textColor: Colors.black,
          icon: Icons.login,
          colorIcon: Colors.black,
          press: () {
            if (_formKey.currentState!.validate()) {
              signInWithEmailAndPassword();
            }
          },
        );
      }
    }

    return Background(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
              SizedBox(height: size.height*0.03,),
              SizedBox( width: size.width*0.15, height: size.height*0.15, child: Image.asset("assets/icons/logo_white.png")),
              Container(
                alignment: Alignment.center,
                child: Text('GREEN TECH', style: GoogleFonts.roboto(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w300)),
              ),
              SizedBox(height: size.height*0.1,),
              Text('Bienvenido,', textAlign: TextAlign.center, style: GoogleFonts.francoisOne(fontSize: 25, color: Colors.white)),
              Text('Por favor, inicie sesión para continuar.', textAlign: TextAlign.center, style: GoogleFonts.oswald(fontSize: 20, color: Colors.white)),
              SizedBox(height: size.height*0.04,),
              RoundedInputField(
                hintText: 'Correo electrónico', 
                icon: Icons.person,
                onChanged: (value) {},
                msgError: 'Email esta vacío.',
                controller: _email,
              ),
              RoundedPasswordField(
                msgError: 'Contraseña vacía',
                controller: _password,
                onChanged: (value) {} 
              ),
              SizedBox(height: size.height*0.015,),
              buildLoginButton(),
              SizedBox(height: size.height*0.04,),
              // boton de reconocimiento facial
              SizedBox(
                height: 70,
                width: 70,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                    child: const  Icon(BootstrapIcons.person_bounding_box, color: fourColor, size: 40),
                ),
              )
          ]
        ),
      ),
    );
  }
}

