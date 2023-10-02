import 'package:flutter/material.dart';

class NavigationDestinationBar extends StatelessWidget {
  final IconData icon, iconselect;
  final String  label;
  const NavigationDestinationBar({
    super.key, 
    required this.icon, 
    required this.iconselect, 
    required this.label,
  });
  
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(iconselect, color: Colors.white,),
      icon: Icon(icon),
      label: label,
    );
  }
}