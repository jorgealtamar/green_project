import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            icon: BootstrapIcons.house,
            tittle: 'Inicio',
            press: (){
              context.go('/home');
            },
          ),
          BottomNavItem(
            icon: BootstrapIcons.geo_alt,
            tittle: 'Canecas',
            press: (){
              context.go('/ubication');
            },
          ),
          BottomNavItem(
            icon: BootstrapIcons.crosshair,
            tittle: 'Detección',
            press: (){
              context.go('/detection');
            },
          ),
          BottomNavItem(
            icon: BootstrapIcons.grid_fill,
            tittle: 'Información',
            isActive: true,
            press: (){
              context.go('/info');
            },
          ),
          BottomNavItem(
            icon: BootstrapIcons.person,
            tittle: 'Cuenta',
            press: (){
              context.go('/account');
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final String tittle;
  final IconData icon;
  final VoidCallback press;
  const BottomNavItem({
    super.key, 
    this.isActive = false, 
    required this.tittle, 
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: isActive ? primaryColor : Colors.black,),
          Text(tittle, style: TextStyle(color: isActive ? primaryColor : Colors.black),)
        ],
      ),
    );
  }
}
