import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/movie_details_model.dart';
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

  static Movie movieDetailsToEntity(MovieDetailsModel movieDetailsModel) =>
    Movie(
      adult: movieDetailsModel.adult,
      backdropPath: (movieDetailsModel.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDetailsModel.backdropPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
      genreIds: movieDetailsModel.genres.map((each) => each.name).toList(),
      id: movieDetailsModel.id,
      originalLanguage: movieDetailsModel.originalLanguage,
      originalTitle: movieDetailsModel.originalTitle,
      overview: movieDetailsModel.overview,
      popularity: movieDetailsModel.popularity,
      posterPath: (movieDetailsModel.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDetailsModel.posterPath}'
          : 'no-poster',
      releaseDate: movieDetailsModel.releaseDate,
      title: movieDetailsModel.title,
      video: movieDetailsModel.video,
      voteAverage: movieDetailsModel.voteAverage,
      voteCount: movieDetailsModel.voteCount,
    );

  static List<Movie> theMovieDbToListEntity(MovieDbResponse movieDbResponse) {
    return movieDbResponse.results
        .map((eachMovie) => MovieMapper.movieDbToEntity(eachMovie))
        .toList();
  }
}
