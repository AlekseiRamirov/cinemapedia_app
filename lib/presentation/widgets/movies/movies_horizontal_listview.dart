import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/config/helpers/human_format.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  State<MoviesHorizontalListview> createState() =>
      _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(widget.title, widget.subTitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                final movie = widget.movies[index];
                return _ItemSlide(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemSlide extends StatelessWidget {
  final Movie movie;

  const _ItemSlide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image for movie
          SizedBox(
            width: 150,
            height: 230,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                movie.posterPath,
                width: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          SizedBox(height: 5),

          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: textTheme.titleSmall,
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              spacing: 2,
              children: [
                Icon(Icons.star_half, color: Colors.orange),
                Text(
                  HumanFormat.numberDecimal(movie.voteAverage),
                  style: textTheme.bodyMedium?.copyWith(color: Colors.orange),
                ),
                Spacer(),

                Icon(Icons.favorite_border_sharp, color: Colors.black54),
                Text(
                  HumanFormat.number(movie.popularity),
                  style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: textTheme.titleLarge),
          Spacer(),
          if (subTitle != null) Text(subTitle!, style: textTheme.titleLarge),
        ],
      ),
    );
  }
}
