import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ApartmentCodeWidget extends StatelessWidget {
  const ApartmentCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.emerald, width: 1),
        color: AppColors.paleGreen.withAlpha(50),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.emerald,
                size: 24,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apartment Code",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.emerald,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "URB-10234",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.emerald,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.copy_rounded, color: AppColors.emerald, size: 24),
        ],
      ),
    );
  }
}
