import 'package:flutter/material.dart';
import 'package:toktok/domain/entities/video_post.dart';
import 'package:toktok/presentation/discover/widgets/full_screen_player.dart';
import 'package:toktok/presentation/discover/widgets/video_action_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenVideoPlayer(
                  url: videoPost.videoUrl, caption: videoPost.caption),
            ),
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoActionButtons(
                  video: videoPost,
                )),
          ],
        );
      },
    );
  }
}
