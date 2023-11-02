import 'package:toktok/domain/entities/video_post.dart';

abstract class VideoPostDataSourceDomain {
  
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getPopularVideosByPage(int page);

}