import 'package:flutter/material.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String videoKey;
  const VideoPlayer({super.key, required this.videoKey});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoKey);
    _controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags: const YoutubePlayerFlags(
        enableCaption: true,
        autoPlay: false,
        mute: false,
        forceHD: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoKey == "") {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.zero,
      child: YoutubePlayer(
        controller: _controller,
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
          EndPoints.youtubeThumnail(widget.videoKey),
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
