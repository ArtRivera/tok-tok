import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktok/presentation/managers/number_format_manager.dart';
import 'package:toktok/domain/entities/video_post.dart';

class VideoActionButtons extends StatelessWidget {
  const VideoActionButtons({super.key, required this.video});

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _CustomIconButton(
          value: video.likes,
          iconData: Icons.favorite,
          color: Colors.red,
          onPressed: () {
            debugPrint("Liked!");
          }),
      _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
          color: Colors.white,
          onPressed: () {
            debugPrint("Viewed!");
          }),
      SpinPerfect(
        infinite: true,
          child: _CustomIconButton(
              iconData: Icons.play_circle_outline,
              color: Colors.white,
              onPressed: () {
                debugPrint("Viewed!");
              }))
    ]);
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton(
      {this.value,
      required this.iconData,
      required this.color,
      this.onPressed});

  final int? value;
  final IconData iconData;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final numberValue = value;

    return Column(children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
        ),
        color: color,
      ),
      if (numberValue != null) Text(NumberFormatManager.readableFormat(numberValue)),
    ]);
  }
}
