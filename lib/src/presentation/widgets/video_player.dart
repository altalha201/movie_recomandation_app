import 'package:flutter/material.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final String videoKey;
  final YoutubePlayerController controller;
  const VideoPlayer({
    super.key,
    required this.videoKey,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (videoKey == "") {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.zero,
      child: YoutubePlayer(
        controller: controller,
        controlsTimeOut: const Duration(microseconds: 1500),
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        bufferIndicator: const Center(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
          ),
        ),
        thumbnail: Image.network(
          EndPoints.youtubeThumnail(videoKey),
          fit: BoxFit.cover,
        ),
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: Colors.white,
              handleColor: Colors.amber,
            ),
          ),
          RemainingDuration(),
          FullScreenButton(),
        ],
      ),
    );
  }
}
