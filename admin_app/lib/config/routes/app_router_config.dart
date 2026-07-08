import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/features/add_new_owner/presentation/screens/add_new_owner_screen.dart';
import 'package:admin_app/features/auth/presentation/screens/login_screen.dart';
import 'package:admin_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
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
        builder: (context, state) => AddNewOwnerScreen(),
      ),
    ],
  );
}
