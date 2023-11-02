import 'package:flutter/material.dart';
import 'package:toktok/domain/entities/video_post.dart';
import 'package:toktok/infrastructure/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  DiscoverProvider({required this.videoPostRepository});

  bool initialLoading = true;
  List<VideoPost> videos = [];
  final VideoPostRepository videoPostRepository;

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
