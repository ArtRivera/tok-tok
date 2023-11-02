import 'package:toktok/domain/data_sources/video_posts_datasource.dart';
import 'package:toktok/domain/entities/video_post.dart';
import 'package:toktok/domain/repositories/video_post_repository.dart';

class VideoPostRepository implements VideoPostRepositoryDomain {

  final VideoPostDataSourceDomain dataSource;

  VideoPostRepository({
    required this.dataSource
  });

  @override
  Future<List<VideoPost>> getPopularVideosByPage(int page) {
    // TODO: implement getPopularVideosByPage
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    // TODO: implement getTrendingVideosByPage
    return dataSource.getTrendingVideosByPage(page);
  }
  
}