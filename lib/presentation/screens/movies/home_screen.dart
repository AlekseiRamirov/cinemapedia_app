import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _HomeView()),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> allNowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final List<Movie> popularMovies = ref.watch(popularMoviesProvider);
    final List<Movie> nowPlayingMoviesSlide = ref.watch(
      moviesSlideShowProvider,
    );

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),

        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: nowPlayingMoviesSlide),

                MoviesHorizontalListview(
                  movies: allNowPlayingMovies,
                  title: 'Now in Cine',
                  subTitle: 'Monday 16',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MoviesHorizontalListview(
                  movies: popularMovies,
                  title: 'Popular Movies',
                  subTitle: 'Monday 16',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
