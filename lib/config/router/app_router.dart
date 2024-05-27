import 'package:go_router/go_router.dart';
import 'package:myapp/screens/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: WelcomeScreen.name,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) =>  const HomeScreen(),
    ),
    GoRoute(
      path: '/ubication',
      name: UbicationScreen.name,
      builder: (context, state) => const UbicationScreen(),
    ),
    GoRoute(
      path: '/detection',
      name: DetectionScreen.name,
      builder: (context, state) => const DetectionScreen(),
    ),
    GoRoute(
      path: '/info',
      name: InfoScreen.name,
      builder: (context, state) => const InfoScreen(),
    ),
    GoRoute(
      path: '/account',
      name: AccountScreen.name,
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/detalle/:id',
      name: DetalleScreen.name,
      builder: (context, state) => DetalleScreen(id: state.pathParameters['id']),
    ),
    GoRoute(
      path: '/tema/:id',
      name: TemaScreen.name,
      builder: (context, state) => TemaScreen(id: state.pathParameters['id']),
    ),
  ],
);