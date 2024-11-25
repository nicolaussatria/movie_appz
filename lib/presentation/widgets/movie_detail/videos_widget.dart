import 'package:movie_app/presentation/blocs/videos/bloc/videos_bloc.dart';
import 'package:movie_app/presentation/screens/watch_videos/watch_videos_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;
  const VideosWidget({super.key, required this.videosBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final videos = state.videos;
          return Padding(
            padding: const EdgeInsets.only(right: 11),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Stack(children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed(
                          './videos',
                          arguments: WatchVideoArguments(
                            videos,
                          ),
                        );
                      },
                      child: const Text('Watch trailers'),
                    ),
                  )
                ])),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
