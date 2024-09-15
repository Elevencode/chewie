import 'dart:io';

import 'package:chewie/src/extensions/string_extension.dart';
import 'package:video_player/video_player.dart';

extension VideoPlayerControllerExt on VideoPlayerController {
  VideoPlayerController copyWith({String? dataSource}) {
    return switch (dataSourceType) {
      DataSourceType.asset => VideoPlayerController.asset(
          dataSource ?? this.dataSource,
          package: package,
          closedCaptionFile: closedCaptionFile,
          videoPlayerOptions: videoPlayerOptions,
        ),
      DataSourceType.contentUri => VideoPlayerController.contentUri(
          dataSource.toUri ?? this.dataSource.toUri,
          closedCaptionFile: closedCaptionFile,
          videoPlayerOptions: videoPlayerOptions,
        ),
      DataSourceType.file => VideoPlayerController.file(
          dataSource.toUri != null
              ? File.fromUri(dataSource.toUri!)
              : File.fromUri(this.dataSource.toUri),
          closedCaptionFile: closedCaptionFile,
          videoPlayerOptions: videoPlayerOptions,
          httpHeaders: httpHeaders,
        ),
      DataSourceType.network => VideoPlayerController.networkUrl(
          dataSource.toUri ?? this.dataSource.toUri,
          formatHint: formatHint,
          closedCaptionFile: closedCaptionFile,
          videoPlayerOptions: videoPlayerOptions,
          httpHeaders: httpHeaders,
        ),
    };
  }
}
