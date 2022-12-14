import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/constants/whatsapp-constants/whatsapp_constant.dart';
import 'package:permission_handler/permission_handler.dart';

class GetWhatsappStatusProvider extends ChangeNotifier {
  List<FileSystemEntity> _getWhatsappImages = [];
  List<FileSystemEntity> _getWhatsappVideos = [];

  bool _isWhatsappAvailable = false;

  List<FileSystemEntity> get getWhatsappImage => _getWhatsappImages;
  List<FileSystemEntity> get getWhatsappVideos => _getWhatsappVideos;

  bool get isWhatsappAvailiable => _isWhatsappAvailable;

  void getWhatsappStatuses(String ext) async {
    final permissionStatus = await Permission.storage.request();

    if (permissionStatus.isDenied) {
      Permission.storage.request();
      log("Permission Denied");
      return;
    }

    if (permissionStatus.isGranted) {
      final whatsappDirectory = Directory(WhatsappStatusPath.whatsappPath);
      if (whatsappDirectory.existsSync()) {
        final whatsappStatuses = whatsappDirectory.listSync();

        if (ext == ".mp4") {
          _getWhatsappVideos = whatsappStatuses
              .where((element) => element.path.endsWith(".mp4"))
              .toList();
          notifyListeners();
        } else {
          _getWhatsappImages = whatsappStatuses
              .where((element) => element.path.endsWith(".jpg"))
              .toList();
          notifyListeners();
        }
        _isWhatsappAvailable = true;
      } else {
        log("No Whatsapp Found");
        _isWhatsappAvailable = false;
        notifyListeners();
      }
    }
  }
}
