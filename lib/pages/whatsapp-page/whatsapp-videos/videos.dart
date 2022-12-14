import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/whatsapp-page/whatsapp-videos/video_player.dart';
import 'package:my_flutter_application_1/services/get-whatsapp-status/get_statuses_for_whatssapp.dart';
import 'package:my_flutter_application_1/utils/thumbnails/get_thumbnails.dart';
import 'package:provider/provider.dart';

class WhatsappVideoHomePage extends StatefulWidget {
  const WhatsappVideoHomePage({super.key});

  @override
  State<WhatsappVideoHomePage> createState() => _WhatsappVideoHomePageState();
}

class _WhatsappVideoHomePageState extends State<WhatsappVideoHomePage> {
  bool _isFeatched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<GetWhatsappStatusProvider>(
        builder: (context, getVideos, child) {
          if (_isFeatched == false) {
            getVideos.getWhatsappStatuses(".mp4");
            Future.delayed(const Duration(microseconds: 1), () {
              _isFeatched = true;
            });
          }
          return getVideos.isWhatsappAvailiable == false
              ? Container(
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Text("WhatsApp Is not Available."),
                  ),
                )
              : getVideos.getWhatsappVideos.isEmpty
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
                            getVideos.getWhatsappVideos.length, (index) {
                          final data = getVideos.getWhatsappVideos[index];
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
