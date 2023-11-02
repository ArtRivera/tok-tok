import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktok/config/theme/app_theme.dart';
import 'package:toktok/infrastructure/data_sources/local_videos_data_source.dart';
import 'package:toktok/infrastructure/repositories/video_post_repository.dart';
import 'package:toktok/presentation/discover/discover_screen.dart';
import 'package:toktok/presentation/discover/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostRepository(dataSource: LocalVideoDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoPostRepository: videoPostRepository)..loadNextPage(),
        )
      ],
      child: MaterialApp(
        title: 'TokTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
