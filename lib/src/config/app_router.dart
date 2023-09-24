import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/data/data_sources/local/mock_auth_data_source.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/presentation/views/login_screen.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/auth/presentation/views/register_screen.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/feed/presentation/views/discover_screen.dart';
import 'package:flutter_social_media_with_clean_architecture/src/features/feed/presentation/views/feed_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'feed',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const FeedScreen();
        },
      ),
      GoRoute(
        name: 'discover',
        path: '/discover',
        builder: (BuildContext context, GoRouterState state) {
          return const DiscoverScreen();
        },
        routes: [
          GoRoute(
            name: 'user',
            path: ':userId',
            builder: (BuildContext context, GoRouterState state) {
              return Container();
            },
          ),
        ],
      ),
      GoRoute(
          name: 'login',
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
          routes: [
            GoRoute(
              name: 'register',
              path: 'register',
              builder: (BuildContext context, GoRouterState state) {
                return const RegisterScreen();
              },
            ),
          ]),
    ],
    redirect: (
      BuildContext context,
      GoRouterState state,
    ) {
      final loginLocation = state.namedLocation('login');
      final registerLocation = state.namedLocation('register');

      final bool authenticated = authBloc.state.authenticationStatus ==
          AuthenticationStatus.authenticated;

      final bool isLoginOrRegister = state.matchedLocation == loginLocation ||
          state.matchedLocation == registerLocation;

      if (!authenticated && !isLoginOrRegister) {
        return '/login';
      }

      if (authenticated && isLoginOrRegister) {
        return '/';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      authBloc.stream,
    ),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  /// Creates a [GoRouterRefreshStream].
  ///
  /// Every time the [stream] receives an event the [GoRouter] will refresh its
  /// current route.
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
