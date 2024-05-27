import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screens/home/components/buttom_home.dart';
import 'package:myapp/screens/home/components/container_fecha.dart';
import 'package:myapp/screens/home/components/container_frase.dart';
import 'package:myapp/services/auth.dart';
import 'package:myapp/services/firebase_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final User? user = Auth().currentUser;
  bool isLoading = true;
  String userName = 'Desconocido';
  String welcomeMessage = 'Bienvenido';

  @override
  void initState() {
    super.initState();
    if (user != null) {
      // Si el usuario está autenticado, intenta obtener su nombre y género desde Firestore.
      getNameAndGender(user?.uid).then((data) {
        if (data[0] != 'desconocido') {
          setState(() {
            userName = data[0]; // Actualiza el nombre si está disponible.
            // Actualiza el mensaje de bienvenida según el género.
            welcomeMessage = data[1] == 'M' ? 'Bienvenido' : 'Bienvenid${
                data[1] == 'F' ? 'a' : '@'
            }';
            isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (isLoading) {
      return Center(
        child: Container(
          color: const Color(0xFFF1EED3),
          child: const AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                // Puedes agregar un texto o cualquier otro contenido aquí.
              ],
            ),
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF1EED3),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                '$welcomeMessage $userName,',
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w200),
              ),
              SizedBox(height: size.height * 0.03),
              const ContainerFecha(),
              SizedBox(height: size.height * 0.03),
              const ContainerFrase(),
              SizedBox(height: size.height * 0.03),
              const Text(
                'Servicios',
                textAlign: TextAlign.left,
                style: TextStyle(color:  Color(0xFF2D2D2D), fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.02),
              ButtomHome(
                colorButtom: const Color(0xFFFFEA9F),
                path: 'assets/images/anuncio.png',
                msg: 'Mantente Informado',
                press: () {
                  context.go('/info');
                },
              ),
              SizedBox(height: size.height * 0.03),
              ButtomHome(
                colorButtom: const Color(0xFF9FEC98),
                path: 'assets/images/scanner.png',
                msg: 'Clasificación de residuos sólidos',
                press: () {
                  context.go('/detection');
                },
              ),
              SizedBox(height: size.height * 0.03),
              ButtomHome(
                colorButtom: const Color(0xFF98DDEC),
                path: 'assets/images/caneca.png',
                msg: 'Encuentra la caneca más cercana.',
                press: () {
                  context.go('/ubication');
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      );
    }
  }
}
