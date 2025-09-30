import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'signup_page.dart';
import 'login_page.dart';

void main() {
  runApp(const PMEApp());
}

class PMEApp extends StatelessWidget {
  const PMEApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PME Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return _createRoute(const LoginPage());
          case '/signup':
            return _createRoute(const SignupPage());
          default:
            return MaterialPageRoute(builder: (_) => const LandingPage());
        }
      },
      home: const LandingPage(),
    );
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}

