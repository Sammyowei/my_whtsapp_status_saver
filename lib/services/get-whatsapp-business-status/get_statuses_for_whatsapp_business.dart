import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:my_flutter_application_1/constants/whatsapp-business-constant/whatsapp_business_constants.dart';

class GetStatusesForWhatsappBusiness extends ChangeNotifier {
  List<FileSystemEntity> _getWhatsappBusinessImages = [];
  List<FileSystemEntity> _getWhatsappBusinessVideos = [];

  bool _isWhatsappBusinessAvailable = false;

  List<FileSystemEntity> get whatsappBusinessImage =>
      _getWhatsappBusinessImages;
  List<FileSystemEntity> get getWhatsappBusinessVideos =>
      _getWhatsappBusinessVideos;

  bool get isWhatsappBusinessAvailiable => _isWhatsappBusinessAvailable;

  void getWhatsappBusinessStatuses(String ext) async {
    final permissionStatus = await Permission.storage.request();

    if (permissionStatus.isDenied) {
      Permission.storage.request();
      log("Permission Denied");
      return;
    }

    if (permissionStatus.isGranted) {
      final whatsappBusinessDirectory =
          Directory(WhatsappBusinessPath.whatsappBusinessPath);
      if (whatsappBusinessDirectory.existsSync()) {
        final whatsappBusinessStatuses = whatsappBusinessDirectory.listSync();

        if (ext == ".mp4") {
          _getWhatsappBusinessVideos = whatsappBusinessStatuses
              .where((element) => element.path.endsWith(".mp4"))
              .toList();
          notifyListeners();
        } else {
          _getWhatsappBusinessImages = whatsappBusinessStatuses
              .where((element) => element.path.endsWith(".jpg"))
              .toList();
          notifyListeners();
        }
        _isWhatsappBusinessAvailable = true;
      } else {
        log("No Whatsapp Business Found");
        _isWhatsappBusinessAvailable = false;
        notifyListeners();
      }
    }
  }
}
