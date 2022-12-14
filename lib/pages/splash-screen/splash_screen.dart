import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/home-page/home_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MyHomePage()),
          (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: Container(
          padding: const EdgeInsets.all(140),
          child: const Center(
            child: Image(
              image: AssetImage(
                "assets/whatsapp-logo.png",
              ),
            ),
          )),
    );
  }
}
