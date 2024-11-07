import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_recruit_app/presentation/home_page/home_page.dart';
import 'package:pro_recruit_app/presentation/initial_page/cubit/initial_page_cubit.dart';
import 'package:pro_recruit_app/presentation/initial_page/initial_screen.dart';

final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<InitialPageCubit>(
          create: (context) => InitialPageCubit(),
          child: const InitialPage(),
        );
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);