import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SpecificRoomHeader extends StatelessWidget {
  const SpecificRoomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double divider = 0.5;
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),

            boxShadow: [
              BoxShadow(
                color: AppColors.black,
                blurRadius: 1.5,
                spreadRadius: -1,
              ),
            ],
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: .start,

            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFf0f9ff),
                    child: Text(
                      "AK",
                      style: TextStyle(
                        color: AppColors.mediumBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Arun Kumar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.grey,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "A-101 • 2BHK",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                height: divider,
                decoration: BoxDecoration(color: AppColors.grey),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "₹18,000",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Rent",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    decoration: BoxDecoration(color: AppColors.grey),
                  ),
                  Column(
                    children: [
                      Text(
                        "04",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Members",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    decoration: BoxDecoration(color: AppColors.grey),
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 0,
                        color: AppColors.paleGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Text(
                            "paid",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF007a55),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
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
}
