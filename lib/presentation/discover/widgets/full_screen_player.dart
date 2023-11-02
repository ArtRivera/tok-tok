import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  const FullScreenVideoPlayer({
    super.key,
    required this.url,
    this.caption = "",
  });

  final String url;
  final String caption;

  @override
  State<FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.url)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          }

          return GestureDetector(
            onTapDown: (_) {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            },
            onTapUp: (_) {
              _controller.play();
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(children: [
                // VideoPlayer
                VideoPlayer(_controller),

                // Overlay
                const VideoOverlay(),

                // Caption
                Positioned(
                  bottom: 40,
                  left: 10,
                  child: VideoCaption(caption: widget.caption),
                ),
              ]),
            ),
          );
        });
  }
}

class VideoCaption extends StatelessWidget {
  const VideoCaption({super.key, this.caption = ""});

  final String caption;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textStyle = Theme.of(context).textTheme.bodySmall;

    return SizedBox(
      width: width * 0.6,
      child: Text(caption, maxLines: 2, style: textStyle),
    );
  }
}

class VideoOverlay extends StatelessWidget {
  const VideoOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.7, 1.0],
      colors: [Colors.transparent, Colors.black87],
    ))));
  }
}
