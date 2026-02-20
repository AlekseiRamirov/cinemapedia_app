import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieInfoProvider = StateNotifierProvider((ref) {
  final fetchMovie = ref.watch(movieRepositoryProvider).getMovieByID;
  return MovieMapNotifier(getMovieCallback: fetchMovie);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovieCallback;

  MovieMapNotifier({required this.getMovieCallback}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    print('Doing http petition');

    final movie = await getMovieCallback(movieId);

    state = {...state, movieId: movie};
  }
}
