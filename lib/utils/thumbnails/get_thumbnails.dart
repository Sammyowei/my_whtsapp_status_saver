import 'package:video_thumbnail/video_thumbnail.dart';

Future<String> getThumbnail(String path) async {
  String? videothumbnail = await VideoThumbnail.thumbnailFile(video: path);
  return videothumbnail!;
}
