import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
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
          Container(
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
                    "A",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.stealBlue,
                    ),
                  ),
                ),
                Text(
                  "Admin",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "admin@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
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
                        Icons.home,
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
                        Icons.add,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Add Apartment",
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
                        Icons.delete,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "Delete Apartment",
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
                        Icons.logout,
                        size: 30,
                        color: AppColors.stealBlue,
                      ),
                      title: Text(
                        "LogOut Profile",
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
