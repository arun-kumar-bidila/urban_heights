import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/features/announcements/presentation/screens/announcements_screen.dart';
import 'package:apartment_app/features/auth/presentation/screens/auth_gateway.dart';
import 'package:apartment_app/features/auth/presentation/screens/login_screen.dart';
import 'package:apartment_app/features/complaints/presentation/screens/complaints_screen.dart';
import 'package:apartment_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:apartment_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:apartment_app/features/rent_status/presentation/screens/rent_status_screen.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:apartment_app/features/rooms/presentation/screens/rooms_screen.dart';
import 'package:apartment_app/features/rooms/presentation/screens/specific_room_screen.dart';
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
      GoRoute(
        path: AppRoutes.rooms,
        builder: (context, state) => RoomsScreen(),
      ),
      GoRoute(
        path: AppRoutes.specificRoomScreen,
        builder: (context, state) {
          final RoomEntity room = state.extra as RoomEntity;
          return SpecificRoomScreen(room: room);
        },
      ),
      GoRoute(
        path: AppRoutes.announcements,
        builder: (context, state) => AnnouncementsScreen(),
      ),
      GoRoute(
        path: AppRoutes.complaints,
        builder: (context, state) => ComplaintsScreen(),
      ),
      GoRoute(
        path: AppRoutes.rentStatus,
        builder: (context, state) => RentStatusScreen(),
      ),
    ],
  );
}
