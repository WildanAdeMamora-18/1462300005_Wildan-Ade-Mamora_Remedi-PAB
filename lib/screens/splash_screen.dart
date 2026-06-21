import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkSession();
  }

  Future<void> checkSession() async {

    await Future.delayed(
      const Duration(seconds: 3),
    );

    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    bool isLogin =
        prefs.getBool("isLogin") ?? false;

    if (isLogin) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/logo.jpg',
              height: 150,
            ),

            const SizedBox(height: 20),

            const CircularProgressIndicator(),

          ],
        ),
      ),
    );
  }
}