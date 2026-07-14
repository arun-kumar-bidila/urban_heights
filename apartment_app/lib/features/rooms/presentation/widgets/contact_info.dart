import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final double divider = 0.5;
    return Column(
      children: [
        Container(
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
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "CONTACT INFO",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.stealBlue,
                  ),
                ),
              ),

              Container(
                height: divider,
                decoration: BoxDecoration(color: AppColors.grey),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.phone, size: 20, color: AppColors.lightBlue),
                    SizedBox(width: 12),
                    Text(
                      "+91 79893 72523",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: divider,
                decoration: BoxDecoration(color: AppColors.grey),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.mail, size: 20, color: AppColors.lightBlue),
                    SizedBox(width: 12),
                    Text(
                      "arunkumarbidi@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: divider,
                decoration: BoxDecoration(color: AppColors.grey),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: AppColors.lightBlue,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Since 1 Mar 2022",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
