import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/themoviedb_response.dart';
import 'package:dio/dio.dart';

class ThemoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.movieDBKey},
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // Do the HTTP petition to API TheMovieDB
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page
    });

    // Process the response json to allow work with data
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    // With our converted response we can go element by element and convert each movie into entity using the mapper
    final List<Movie> listNowPlayingMovies = movieDbResponse.results
        .map((eachMovie) => MovieMapper.movieDbToEntity(eachMovie))
        .where((eachMovie) => eachMovie.posterPath != 'no-poster')
        .toList();

    return listNowPlayingMovies;
  }
}
