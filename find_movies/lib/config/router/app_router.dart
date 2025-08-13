import 'package:go_router/go_router.dart';

import '../../features/movies/presentation/views/main_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        return TrendingMoviesPage();
      },
      routes: [
        // GoRoute(
        //   path: 'movie/:id',
        //   name: MovieScreen.name,
        //   builder: (context, state) {
        //     final movieId = state.pathParameters['id'] ?? 'no-id';

        //     return MovieScreen(movieId: movieId);
        //   },
        // ),
      ],
    ),
    GoRoute(path: '/', redirect: (_, __) => '/home/0'),
  ],
);
