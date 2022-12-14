import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/whatsapp-page/whatsapp-images/image_view.dart';
import 'package:my_flutter_application_1/services/get-whatsapp-business-status/get_statuses_for_whatsapp_business.dart';
import 'package:provider/provider.dart';

class WhatsappBusinessImageHomePage extends StatefulWidget {
  const WhatsappBusinessImageHomePage({super.key});

  @override
  State<WhatsappBusinessImageHomePage> createState() =>
      _WhatsappBusinessImageHomePageState();
}

class _WhatsappBusinessImageHomePageState
    extends State<WhatsappBusinessImageHomePage> {
  bool _isFeatched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetStatusesForWhatsappBusiness>(
        builder: (context, getFile, child) {
          if (_isFeatched == false) {
            getFile.getWhatsappBusinessStatuses(".jpg");
            Future.delayed(const Duration(microseconds: 2), () {
              return _isFeatched = true;
            });
          }
          return getFile.isWhatsappBusinessAvailiable == false
              ? Container(
                  padding: EdgeInsets.zero,
                  child: const Center(
                      child: Text("No WhatsApp Business Availiable")),
                )
              : getFile.whatsappBusinessImage.isEmpty
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
                          getFile.whatsappBusinessImage.length,
                          (index) {
                            final data = getFile.whatsappBusinessImage[index];
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
