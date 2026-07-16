import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:apartment_app/features/profile/presentation/widgets/apartment_code_widget.dart';
import 'package:apartment_app/features/profile/presentation/widgets/owner_info.dart';
import 'package:apartment_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:apartment_app/singletons/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.stealBlue,
          ),
        ),
      ),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            ProfileHeader(),
            ApartmentCodeWidget(),
            OwnerInfo(),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black,
                    blurRadius: 1.5,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Sign Out",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.red,
                        ),
                      ),

                      Text(
                        "Log Out of this device",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      final storage = sl<FlutterSecureStorage>();

                      await storage.delete(key: "token");

                      if (context.mounted) {
                        context.read<FetchApartmentBloc>().add(
                          ResetApartmentBlocEvent(),
                        );
                        context.go(AppRoutes.login);
                      }
                    },
                    child: Icon(Icons.logout, size: 24, color: AppColors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
