import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_aula13/Home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(TelaApp());
}

class TelaApp extends StatelessWidget {
  const TelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))))),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Icon(Icons.home),
        splashIconSize: 500,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        nextScreen: Home(),
        backgroundColor: Colors.red,
      ),
    );
  }
}
