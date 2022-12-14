import 'package:flutter/material.dart';

Widget appName() {
  return const Text(
    "Whatsapp Status Saver",
    textAlign: TextAlign.start,
    style: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
  );
}

Widget companyName() {
  return const Center(
    child: Text(
      "Powered by Bumble Studio",
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    ),
  );
}
