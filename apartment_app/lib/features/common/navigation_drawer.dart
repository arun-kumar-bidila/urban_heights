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
          SizedBox(height: 80),
          BlocBuilder<FetchApartmentBloc, FetchApartmentState>(
            builder: (context, state) {
              if (state is FetchApartmentSuccess) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Icon(
                            Icons.apartment_rounded,
                            size: 35,
                            color: AppColors.lightBlue,
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                state.apartmentEntity.apartmentName
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                "Apartment Management Portal",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xFF2b3c52),
                      ),

                      width: double.infinity,

                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.mediumBlue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              state.apartmentEntity.ownerName[0].toUpperCase(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                state.apartmentEntity.ownerName.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),

                              Row(
                                children: [
                                  Text(
                                    state.apartmentEntity.ownerMobile,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColors.emerald,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                      context.go(AppRoutes.rooms);
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
                      context.go(AppRoutes.profile);
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
                      context.go(AppRoutes.profile);
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
                      context.go(AppRoutes.profile);
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
                      context.go(AppRoutes.profile);
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
