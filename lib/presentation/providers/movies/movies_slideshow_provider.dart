import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final playingMovies = ref.watch(nowPlayingMoviesProvider);

  if (playingMovies.isEmpty) return [];

  return playingMovies.sublist(0, 6);
});
