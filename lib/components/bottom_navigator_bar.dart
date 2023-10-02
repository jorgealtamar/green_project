import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:green_project/components/navigation_destination_bar.dart';
import 'package:green_project/constants.dart';
import 'package:green_project/screens/Account/account_screen.dart';
import 'package:green_project/screens/Detection/detection_screen.dart';
import 'package:green_project/screens/Info/info_screen.dart';
import 'package:green_project/screens/Ubication/ubication_screen.dart';
import 'package:green_project/screens/home/home_screen.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NavigationExample();
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: primaryColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestinationBar(
            icon:BootstrapIcons.house ,
            iconselect: BootstrapIcons.house_fill,
            label: 'Inicio',
          ),
          NavigationDestinationBar(
            iconselect: BootstrapIcons.geo_alt_fill,
            icon: BootstrapIcons.geo_alt,
            label: 'Canecas',
          ),
          NavigationDestinationBar(
            iconselect:BootstrapIcons.crosshair2 ,
            icon: BootstrapIcons.crosshair,
            label: 'Detección',
          ),
          NavigationDestinationBar(
            iconselect: BootstrapIcons.grid_fill,
            icon: BootstrapIcons.grid,
            label: 'Información',
          ),
          NavigationDestinationBar(
            iconselect: BootstrapIcons.person_fill,
            icon: BootstrapIcons.person,
            label: 'Cuenta',
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        const UbicationScreen(),
        const DetectionScreen(),
        const InfoScreen(),
        const AccountScreen(),
      ][currentPageIndex],
    );
  }
}


