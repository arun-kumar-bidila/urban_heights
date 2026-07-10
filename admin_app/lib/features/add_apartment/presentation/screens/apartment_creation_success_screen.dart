import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';

class ApartmentCreationSuccessScreen extends StatefulWidget {
  const ApartmentCreationSuccessScreen({super.key});

  @override
  State<ApartmentCreationSuccessScreen> createState() =>
      _ApartmentCreationSuccessScreenState();
}

class _ApartmentCreationSuccessScreenState
    extends State<ApartmentCreationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomNavigationDrawer(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),

          decoration: BoxDecoration(
            color: AppColors.stealBlue,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.5, color: AppColors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: .min,

            children: [
              CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 60,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.emerald,
                  size: 80,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "APARTMENT CREATED",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    "Apartment Code : *****",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Owner Code : *****",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Password : *****",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
