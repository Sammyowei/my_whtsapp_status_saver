import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageView extends StatefulWidget {
  final String? imagePath;
  const ImageView({super.key, this.imagePath});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  List buttonsList = <Widget>[
    const Icon(
      Icons.download,
      color: Colors.white,
    ),
    const Icon(
      Icons.print,
      color: Colors.white,
    ),
    const Icon(
      Icons.share,
      color: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: FileImage(File(widget.imagePath!)))),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(buttonsList.length, (index) {
            return FloatingActionButton(
              heroTag: "$index",
              onPressed: () {
                switch (index) {
                  case 0:
                    log("Download Image");
                    ImageGallerySaver.saveFile(widget.imagePath!).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Image Saved"),
                        ),
                      );
                    });

                    break;
                  case 1:
                    log("Print file to pdf");
                    FlutterNativeApi.printImage(
                      widget.imagePath!,
                      widget.imagePath!.split("/").last,
                    );
                    break;
                  case 2:
                    log("Share Image");
                    FlutterNativeApi.shareImage(widget.imagePath!);
                    break;
                }
              },
              child: buttonsList[index],
            );
          }),
        ),
      ),
    );
  }
}
