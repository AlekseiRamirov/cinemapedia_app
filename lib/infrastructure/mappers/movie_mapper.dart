import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/themoviedb_model.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/themoviedb_response.dart';

class MovieMapper {
  static Movie movieDbToEntity(TheMovieDbModel theMovieDbModel) => Movie(
    adult: theMovieDbModel.adult,
    backdropPath: (theMovieDbModel.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${theMovieDbModel.backdropPath}'
        : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
    genreIds: theMovieDbModel.genreIds.map((each) => each.toString()).toList(),
    id: theMovieDbModel.id,
    originalLanguage: theMovieDbModel.originalLanguage,
    originalTitle: theMovieDbModel.originalTitle,
    overview: theMovieDbModel.overview,
    popularity: theMovieDbModel.popularity,
    posterPath: (theMovieDbModel.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${theMovieDbModel.posterPath}'
        : 'no-poster',
    releaseDate: theMovieDbModel.releaseDate,
    title: theMovieDbModel.title,
    video: theMovieDbModel.video,
    voteAverage: theMovieDbModel.voteAverage,
    voteCount: theMovieDbModel.voteCount,
  );

  static List<Movie> theMovieDbToListEntity(MovieDbResponse movieDbResponse) {
    return movieDbResponse.results
        .map((eachMovie) => MovieMapper.movieDbToEntity(eachMovie))
        .toList();
  }
}
