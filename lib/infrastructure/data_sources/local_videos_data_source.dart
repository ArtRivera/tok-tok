import 'package:toktok/domain/data_sources/video_posts_datasource.dart';
import 'package:toktok/domain/entities/video_post.dart';
import 'package:toktok/domain/shared/data/local_video_post.dart';
import 'package:toktok/infrastructure/models/LocalVideoPostModel.dart';

class LocalVideoDataSource implements VideoPostDataSourceDomain {
  @override
  Future<List<VideoPost>> getPopularVideosByPage(int page) {
    // TODO: implement getPopularVideosByPage
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPost())
        .toList();

    return newVideos;
  }
}
