import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/common_button.dart';
import 'package:admin_app/features/common/common_textfield.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddApartmentScreen extends StatefulWidget {
  const AddApartmentScreen({super.key});

  @override
  State<AddApartmentScreen> createState() => _AddApartmentScreenState();
}

class _AddApartmentScreenState extends State<AddApartmentScreen> {
  final TextEditingController _apartmentNameController =
      TextEditingController();

  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                        child: Form(
                          key: formKey,
                          child: Column(
                            spacing: 24,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // TODO ADD LOGO + APP NAME
                              Text(
                                "Create Apartment",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),

                              CommonTextfield(
                                label: "Apartment Name",
                                prefixIcon: Icons.apartment,
                                hintText: "Shri apartments",
                                controller: _apartmentNameController,
                                isPassword: false,
                              ),
                              CommonTextfield(
                                label: "Owner Name",
                                prefixIcon: Icons.person,
                                hintText: "Rao",
                                controller: _ownerNameController,
                                isPassword: false,
                              ),
                              CommonTextfield(
                                label: "Owner Mobile Number",
                                prefixIcon: Icons.phone,
                                hintText: "9876543210",
                                controller: _mobileNumberController,
                                isPassword: false,
                              ),
                              CommonTextfield(
                                label: "Address",
                                prefixIcon: Icons.location_on,
                                hintText: "5-73 Gachibowli",
                                controller: _addressController,
                                isPassword: false,
                              ),

                              CommonButton(
                                buttonName: "Continue",
                                onTap: () {
                                  // if (formKey.currentState?.validate() ??
                                  //     false) {
                                  context.go(
                                    AppRoutes.createPassword,
                                    extra: {
                                      "apartmentName": _apartmentNameController
                                          .text
                                          .trim(),
                                      "ownerName": _ownerNameController.text
                                          .trim(),
                                      "mobile": _mobileNumberController.text
                                          .trim(),
                                      "address": _addressController.text.trim(),
                                    },
                                  );
                                  // }
                                },
                              ),
                            ],
                          ),
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
