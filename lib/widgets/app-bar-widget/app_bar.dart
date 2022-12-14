import 'package:flutter/material.dart';

class AppBarWidget {
  static Text whatsappAppbartitle = const Text(" Whatsapp Status Saver");
  static Text whatsappBisAppBarTitle =
      const Text("Whatsapp Business Status Saver");
  static bool centerText = true;
  static final appBar = AppBar(
    title: whatsappAppbartitle,
    centerTitle: centerText,
  );
  static final waAppBar = AppBar(
    title: whatsappBisAppBarTitle,
    centerTitle: centerText,
  );
}
