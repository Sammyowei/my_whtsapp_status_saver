import 'package:flutter/material.dart';

Widget bottomNav() {
  return BottomNavigationBar(
    onTap: ((value) {}),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.image), label: "Images"),
      BottomNavigationBarItem(
          icon: Icon(Icons.video_library_rounded), label: "Videos"),
    ],
  );
}
