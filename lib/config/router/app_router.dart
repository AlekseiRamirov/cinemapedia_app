import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: '/movie/:id', //We send an argument string ID
          name: MovieInfoScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieInfoScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
