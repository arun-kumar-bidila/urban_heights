import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({super.key});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: AppColors.mainGradient,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "July 2026 • Rent Collection",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightWhite,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "₹70,000",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "of ₹1,40,000 expected",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightWhite,
                ),
              ),
              SizedBox(height: 16),
              LinearProgressIndicator(
                value: 0.7,
                minHeight: 12,
                borderRadius: BorderRadius.circular(16),
                color: AppColors.lightBlue,
                backgroundColor: Color(0xFF446384),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "50% collected",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightWhite,
                    ),
                  ),
                  Text(
                    "₹70,000 outstanding",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lightWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderFeature(
                value: "8",
                valueColor: AppColors.black,
                desc: "Occupied of 9",
              ),
              SizedBox(width: 16),
              _buildHeaderFeature(
                value: "8",
                valueColor: AppColors.red,
                desc: "Overdue Rooms",
              ),
              SizedBox(width: 16),
              _buildHeaderFeature(
                value: "8",
                valueColor: AppColors.red,
                desc: "Open Issues complaints",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderFeature({
    required String value,
    required String desc,
    required Color valueColor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: AppColors.box,
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: valueColor,
              ),
            ),
            SizedBox(height: 6),
            Text(
              desc,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
