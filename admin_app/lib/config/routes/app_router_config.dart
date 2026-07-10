import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/features/add_apartment/presentation/screens/add_apartment_screen.dart';
import 'package:admin_app/features/add_apartment/presentation/screens/create_password_screen.dart';
import 'package:admin_app/features/auth/presentation/screens/auth_gateway.dart';
import 'package:admin_app/features/auth/presentation/screens/login_screen.dart';
import 'package:admin_app/features/dashboard/presentation/screens/dashboard_screen.dart';
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
        path: AppRoutes.addNew,
        builder: (context, state) => AddApartmentScreen(),
      ),
      GoRoute(
        path: AppRoutes.createPassword,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return CreatePasswordScreen(
            apartmentName: data["apartmentName"],
            ownerName: data["ownerName"],
            mobile: data["mobile"],
            address: data["address"],
          );
        },
      ),
    ],
  );
}
