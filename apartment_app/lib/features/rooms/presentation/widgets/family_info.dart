import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FamilyInfo extends StatefulWidget {
  const FamilyInfo({super.key});

  @override
  State<FamilyInfo> createState() => _FamilyInfoState();
}

class _FamilyInfoState extends State<FamilyInfo> {
  final double divider = 0.5;
  @override
  Widget build(BuildContext context) {
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
                  "FAMILY MEMBERS",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Father",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      "Sreenivasulu",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mother",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      "Laxmi",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wife",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      "Kayadu",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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
