import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.stealBlue,
      child: Column(
        children: [
          SizedBox(height: 50),
          BlocBuilder<FetchApartmentBloc, FetchApartmentState>(
            builder: (context, state) {
              if (state is FetchApartmentSuccess) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  color: AppColors.stealBlue,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          state.adminEntity.apartmentName[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColors.stealBlue,
                          ),
                        ),
                      ),
                      Text(
                        " .name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        " state..email",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container(height: 100, color: AppColors.stealBlue);
            },
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              color: AppColors.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.dashboard);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.dashboard_rounded,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Dashboard Overview",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.addNew);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.home_work_rounded,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Rooms & Tenants",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.addNew);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.chat,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Complaints",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.addNew);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.wallet,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Rent Status",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.addNew);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.speaker_phone_sharp,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Announcements",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go(AppRoutes.addNew);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
