import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/features/auth/presentation/screens/auth_gateway.dart';
import 'package:apartment_app/features/auth/presentation/screens/login_screen.dart';
import 'package:apartment_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:apartment_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class GoRouterConfig {
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.authGateway,
    routes: [
      GoRoute(
        path: AppRoutes.authGateway,
        builder: (context, state) => AuthGateway(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );
}
