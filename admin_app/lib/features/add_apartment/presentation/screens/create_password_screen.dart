import 'package:admin_app/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/common_button.dart';
import 'package:admin_app/features/common/common_textfield.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:go_router/go_router.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String apartmentName;
  final String ownerName;
  final String mobile;
  final String address;
  final String? ownerCode;
  const CreatePasswordScreen({
    super.key,
    required this.apartmentName,
    required this.ownerName,
    required this.address,
    required this.mobile,
    this.ownerCode,
  });

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset("assets/icons/urban_heights.png", height: 200),
                      // SizedBox(height: 50),
                      Container(
                        width: double.infinity,
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
                          spacing: 24,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TODO ADD LOGO + APP NAME
                            Text(
                              "Create Password",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ),

                            CommonTextfield(
                              label: "New Password",
                              prefixIcon: Icons.lock,
                              hintText: "***********",
                              controller: _newPassword,
                              isPassword: true,
                            ),
                            CommonTextfield(
                              label: "Confirm Password",
                              prefixIcon: Icons.lock,
                              hintText: "*******",
                              controller: _confirmPassword,
                              isPassword: true,
                            ),

                            CommonButton(
                              buttonName: "Create",
                              onTap: () {
                                context.go(
                                  AppRoutes.apartmentCreationSuccessScreen,
                                );

                                // CustomToast.show(
                                //   message: "Success with creation",
                                //   type: ToastType.success,
                                // );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
