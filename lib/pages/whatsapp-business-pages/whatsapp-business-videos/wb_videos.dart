import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/whatsapp-page/whatsapp-videos/video_player.dart';
import 'package:my_flutter_application_1/services/get-whatsapp-business-status/get_statuses_for_whatsapp_business.dart';
import 'package:my_flutter_application_1/utils/thumbnails/get_thumbnails.dart';
import 'package:provider/provider.dart';

class WhatsappBusinessVideoHomePage extends StatefulWidget {
  const WhatsappBusinessVideoHomePage({super.key});

  @override
  State<WhatsappBusinessVideoHomePage> createState() =>
      _WhatsappBusinessVideoHomePageState();
}

class _WhatsappBusinessVideoHomePageState
    extends State<WhatsappBusinessVideoHomePage> {
  bool _isFeatched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GetStatusesForWhatsappBusiness>(
        builder: (context, getVideos, child) {
          if (_isFeatched == false) {
            getVideos.getWhatsappBusinessStatuses(".mp4");
            Future.delayed(const Duration(microseconds: 1), () {
              _isFeatched = true;
            });
          }
          return getVideos.isWhatsappBusinessAvailiable == false
              ? Container(
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Text("Whatsapp Business Is not Available."),
                  ),
                )
              : getVideos.getWhatsappBusinessVideos.isEmpty
                  ? Container(
                      padding: EdgeInsets.zero,
                      child: const Center(
                        child: Text("""No videos to display 
          please view some statuses then check back later"""),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.zero,
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                        ),
                        children: List.generate(
                            getVideos.getWhatsappBusinessVideos.length,
                            (index) {
                          final data =
                              getVideos.getWhatsappBusinessVideos[index];
                          return FutureBuilder(
                            future: getThumbnail(data.path),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AppVideoPlayer(
                                            videoPath: data.path,
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(
                                                File(snapshot.data!),
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.green.withOpacity(0.5),
                                      ),
                                    );
                            },
                          );
                        }),
                      ),
                    );
        },
      ),
    );
  }
}
