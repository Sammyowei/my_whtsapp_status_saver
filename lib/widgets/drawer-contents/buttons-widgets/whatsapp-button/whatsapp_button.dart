import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/home-page/home_page.dart';
import 'package:my_flutter_application_1/pages/whatsapp-business-pages/home-page/whatsapp_business_homepage.dart';

class WhatsappBusinessButton extends StatefulWidget {
  const WhatsappBusinessButton({super.key});

  @override
  State<WhatsappBusinessButton> createState() => _WhatsappBusinessButtonState();
}

class _WhatsappBusinessButtonState extends State<WhatsappBusinessButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyWhatsappBusinessHomePage(),
              ),
              (route) => false);
        },
        child: const Text(
          "Whatsapp Busines Statuses",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
        ));
  }
}

class WhatsappStatusButton extends StatefulWidget {
  const WhatsappStatusButton({super.key});

  @override
  State<WhatsappStatusButton> createState() => _WhatsappStatusButtonState();
}

class _WhatsappStatusButtonState extends State<WhatsappStatusButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
              (route) => false);
        },
        child: const Text(
          "Whatsapp Statuses",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
        ));
  }
}
