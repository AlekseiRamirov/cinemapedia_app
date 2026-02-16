import 'package:cinemapedia_app/infrastructure/datasources/themoviedb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This provider is inmutable, gi ve to others provider the info that have the Movie Repository Implementation
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(ThemoviedbDatasource());
});
