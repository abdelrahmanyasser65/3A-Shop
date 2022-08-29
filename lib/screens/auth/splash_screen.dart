import 'package:flutter/material.dart';
import 'package:sh/components/components.dart';


class SplashScreen extends StatefulWidget {
 final Widget startWidget;

  const SplashScreen({super.key, required this.startWidget});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      navigateTo(context,widget.startWidget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
