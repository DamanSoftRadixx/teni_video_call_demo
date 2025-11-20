import 'package:teni_video_call_demo/di.dart' show getIt;
import 'package:teni_video_call_demo/feature/login/presentation/bloc/login_bloc.dart';
import 'package:teni_video_call_demo/feature/login/presentation/screen/login_screenn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:teni_video_call_demo/feature/video_calling/domain/entities/video_calling_parsing_model.dart';
import 'package:teni_video_call_demo/feature/video_calling/presentation/screen/video_calling.dart';
import '../../feature/splash/presentation/screen/splash_screen.dart';
import '../../feature/video_calling/presentation/bloc/video_calling_bloc.dart';

class AppRouter {
  AppRouter._(); // Private constructor

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginBloc>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RoutePaths.videoCalling,
        name: RouteNames.videoCalling,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<VideoCallingBloc>(),
          child: VideoCallingScreen(
            videoCallingParsingModel: state.extra as VideoCallingParsingModel,
          ),
        ),
      ),

      // ShellRoute(
      //   builder: (context, state, child) {
      //     return BlocProvider(
      //       create: (_) => getIt<ProductsBloc>(),
      //       child: child,
      //     );
      //   },
      //   routes: [
      //     GoRoute(
      //       path: RoutePaths.productList,
      //       name: RouteNames.productList,
      //       builder: (context, state) {
      //         final user = state.extra as User;
      //         return ProductListScreen(user: user);
      //       },
      //     ),
      //     GoRoute(
      //       path: RoutePaths.productDetail,
      //       name: RouteNames.productDetail,
      //       builder: (context, state) {
      //         final product = state.extra as ProductListLocal;
      //         return ProductDetailScreen(product: product);
      //       },
      //     ),
      //   ],
      // ),
    ],
    errorBuilder: _errorBuilder,
  );
  static Widget _errorBuilder(BuildContext context, GoRouterState state) {
    return const Scaffold(body: Center(child: Text('404 - Page Not Found')));
  }
}

class RoutePaths {
  static const String splash = '/';
  static const String login = '/login';
  static const String videoCalling = '/video_calling';
}

class RouteNames {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String videoCalling = 'video_calling';
}
