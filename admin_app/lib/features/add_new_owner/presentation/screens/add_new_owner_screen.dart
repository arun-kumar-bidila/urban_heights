import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/common_button.dart';
import 'package:admin_app/features/common/common_textfield.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewOwnerScreen extends StatefulWidget {
  const AddNewOwnerScreen({super.key});

  @override
  State<AddNewOwnerScreen> createState() => _AddNewOwnerScreenState();
}

class _AddNewOwnerScreenState extends State<AddNewOwnerScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    color: Appcolors.black,
                    blurRadius: 1.5,
                    spreadRadius: -1,
                  ),
                ],
                color: Appcolors.white,
              ),
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO ADD LOGO + APP NAME
                  Text(
                    "Create Owner",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Appcolors.black,
                    ),
                  ),
                  // CommonTextfield(
                  //   label: "Apartment Name",
                  //   prefixIcon: Icons.lock,
                  //   hintText: "Shri Apartments",
                  //   controller: _password,
                  //   isPassword: false,
                  // ),
                  // CommonTextfield(
                  //   label: "Apartment Address",
                  //   prefixIcon: Icons.location_city,
                  //   hintText: "example@gmail.com",
                  //   controller: _email,
                  //   isPassword: false,
                  // ),
                  CommonTextfield(
                    label: "Owner Email ID",
                    prefixIcon: Icons.mail,
                    hintText: "example@gmail.com",
                    controller: _email,
                    isPassword: false,
                  ),
                  CommonTextfield(
                    label: "Owner Mobile Number",
                    prefixIcon: Icons.lock,
                    hintText: "9876543210",
                    controller: _password,
                    isPassword: false,
                  ),
                  // CommonTextfield(
                  //   label: "Create Password",
                  //   prefixIcon: Icons.lock,
                  //   hintText: "********",
                  //   controller: _password,
                  //   isPassword: true,
                  // ),
                  CommonButton(
                    buttonName: "Continue",
                    onTap: () {
                      context.go(AppRoutes.dashboard);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
