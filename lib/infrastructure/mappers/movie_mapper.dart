import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/themoviedb/movie_from_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieFromMovieDb movieFromMovieDB) => Movie(
    adult: movieFromMovieDB.adult,
    backdropPath: (movieFromMovieDB.backdropPath != '')
    ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDB.backdropPath}'
    : 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
    genreIds:movieFromMovieDB.genreIds.map((each) => each.toString()).toList(),
    id: movieFromMovieDB.id,
    originalLanguage: movieFromMovieDB.originalLanguage,
    originalTitle: movieFromMovieDB.originalTitle,
    overview: movieFromMovieDB.overview,
    popularity: movieFromMovieDB.popularity,
    posterPath: (movieFromMovieDB.posterPath != '')
    ? 'https://image.tmdb.org/t/p/w500${movieFromMovieDB.posterPath}'
    : 'no-poster',
    releaseDate: movieFromMovieDB.releaseDate,
    title: movieFromMovieDB.title,
    video: movieFromMovieDB.video,
    voteAverage: movieFromMovieDB.voteAverage,
    voteCount: movieFromMovieDB.voteCount,
  );
}
