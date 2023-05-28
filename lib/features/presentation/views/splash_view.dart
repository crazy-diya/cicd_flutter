import 'package:flutter/material.dart';
import 'package:test1/utils/navigation_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: const Text("Started! Click me!"),
          onTap: () {
            Navigator.pushNamed(context, Routes.showListScreen);
          },
        ),
      ),
    );
  }
}
