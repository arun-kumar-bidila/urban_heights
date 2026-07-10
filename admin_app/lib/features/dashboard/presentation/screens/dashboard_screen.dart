import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:admin_app/features/dashboard/presentation/bloc/dashboard_summary/dashboard_summary_bloc.dart';
import 'package:admin_app/features/dashboard/presentation/widgets/dashboard_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardSummaryBloc>().add(DashboardSummary());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: BlocBuilder<DashboardSummaryBloc, DashboardSummaryState>(
          builder: (context, state) {
            if (state is DashboardSummaryLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.stealBlue),
              );
            } else if (state is DashboardSummaryFailure) {
              return SizedBox.shrink();
            } else if (state is DashboardSummarySuccess) {
              return Column(
                children: [
                  SizedBox(height: 16),

                  DashboardFeature(
                    icon: Icons.person,
                    iconColor: AppColors.white,
                    labelText: "Total Owners",
                    iconBg: AppColors.lightGreen,
                    valueText: state.summaryEntity.totalOwners.toString(),
                  ),
                  SizedBox(height: 16),
                  DashboardFeature(
                    icon: Icons.home,
                    iconColor: AppColors.white,
                    labelText: "Total Apartments",
                    iconBg: AppColors.stealBlue,
                    valueText: state.summaryEntity.totalApartments.toString(),
                  ),
                ],
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
