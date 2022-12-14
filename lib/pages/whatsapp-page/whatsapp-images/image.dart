import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/whatsapp-page/whatsapp-images/image_view.dart';
import 'package:my_flutter_application_1/services/get-whatsapp-status/get_statuses_for_whatssapp.dart';
import 'package:provider/provider.dart';

class WhatsappImageHomePage extends StatefulWidget {
  const WhatsappImageHomePage({super.key});

  @override
  State<WhatsappImageHomePage> createState() => _WhatsappImageHomePageState();
}

class _WhatsappImageHomePageState extends State<WhatsappImageHomePage> {
  bool _isFeatched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GetWhatsappStatusProvider>(
        builder: (context, getFile, child) {
          if (_isFeatched == false) {
            getFile.getWhatsappStatuses(".jpg");
            Future.delayed(const Duration(microseconds: 1), () {
              return _isFeatched = true;
            });
          }
          return getFile.isWhatsappAvailiable == false
              ? Container(
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Text("WhatsApp is not Available."),
                  ),
                )
              : getFile.getWhatsappImage.isEmpty
                  ? Container(
                      padding: EdgeInsets.zero,
                      child: const Center(
                        child: Text("""No images to display 
          please view some status then check back later"""),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.zero,
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                        ),
                        children: List.generate(
                          getFile.getWhatsappImage.length,
                          (index) {
                            final data = getFile.getWhatsappImage[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ImageView(
                                      imagePath: data.path,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(data.path),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
