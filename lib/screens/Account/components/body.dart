import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screens/Account/components/profile_menu.dart';
import 'package:myapp/screens/Account/components/profile_pic.dart';
import 'package:myapp/services/auth.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  Future<void> signOut() async{
    await Auth().signOut();
  }

  void showLogoutSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Cierre de sesión',
          message: 'Sesión cerrada correctamente.',
          contentType: ContentType.success,
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        const ProfilePic(),
        const SizedBox(height: 20,),
        ProfileMenu(
          icon: BootstrapIcons.person,
          text: 'Mi cuenta',
          press: (){},
        ),
        ProfileMenu(
          icon: BootstrapIcons.question_circle,
          text: 'Configuración',
          press: (){},
        ),
        ProfileMenu(
          icon: BootstrapIcons.info_circle,
          text: 'Centro de ayuda',
          press: (){},
        ),
        ProfileMenu(
          icon: BootstrapIcons.box_arrow_right,
          text: 'Cerrar Sesión',
          press: (){
            signOut();
            showLogoutSnackBar(context);
          },
        ),
      ],
    );
  }
}

