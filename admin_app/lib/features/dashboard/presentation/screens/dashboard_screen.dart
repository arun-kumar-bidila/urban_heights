import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:admin_app/features/dashboard/presentation/widgets/dashboard_feature.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),

            DashboardFeature(
              icon: Icons.person,
              iconColor: Appcolors.white,
              labelText: "Total Owners",
              iconBg: Appcolors.lightGreen,
              valueText: "20",
            ),
            SizedBox(height: 16),
            DashboardFeature(
              icon: Icons.home,
              iconColor: Appcolors.white,
              labelText: "Total Apartments",
              iconBg: Appcolors.stealBlue,
              valueText: "20",
            ),
          ],
        ),
      ),
    );
  }
}
