import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/themoviedb_response.dart';
import 'package:dio/dio.dart';

class ThemoviedbDatasource extends MoviesDatasource {
  //Base http petition
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'api_key': Environment.movieDBKey},
    ),
  );

  /*Implementation of the methods in abstract class
  */
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    // Process the response json to allow work with data
    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = MovieMapper.theMovieDbToListEntity(
      movieDbResponse,
    );

    return movies;
  }

  Future<List<Movie>> _getListMovies(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    // Do the HTTP petition to API TheMovieDB
    final Response response = await dio.get(
      url,
      queryParameters: queryParameters,
    );

    // Process the response json to allow work with data
    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    //Use the mapper to transform response model to entity
    final List<Movie> movies = MovieMapper.theMovieDbToListEntity(
      movieDbResponse,
    );
    
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return _getListMovies(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    return _getListMovies(
      '/movie/popular',
      queryParameters: {'page': page},
    );
  }
}
