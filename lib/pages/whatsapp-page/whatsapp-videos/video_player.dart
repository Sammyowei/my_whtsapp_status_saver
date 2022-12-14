import 'dart:io';
import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  final String? videoPath;
  const AppVideoPlayer({Key? key, this.videoPath}) : super(key: key);

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  ChewieController? _chewieController;

  List buttonList = const <Widget>[
    Icon(
      Icons.download_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.share,
      color: Colors.white,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(
        File(widget.videoPath!),
      ),
      autoInitialize: true,
      autoPlay: true,
      allowFullScreen: true,
      looping: true,
      fullScreenByDefault: false,
      allowMuting: true,
      aspectRatio: 16 / 9,
      errorBuilder: ((context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _chewieController!.pause();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Chewie(controller: _chewieController!),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          children: List.generate(buttonList.length, (index) {
            return FloatingActionButton(
              backgroundColor: Colors.green,
              heroTag: "$index",
              onPressed: () {
                switch (index) {
                  case 0:
                    log("Downloading Video");
                    ImageGallerySaver.saveFile(widget.videoPath!).then((value) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Video has been saved"),
                        ),
                      );
                    });
                    break;

                  case 1:
                    log("Share Video");
                    FlutterNativeApi.shareVideo(widget.videoPath!);
                    break;
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
