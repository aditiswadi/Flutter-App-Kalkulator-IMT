import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kalkulator_imt/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/get-started', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/icon2.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
