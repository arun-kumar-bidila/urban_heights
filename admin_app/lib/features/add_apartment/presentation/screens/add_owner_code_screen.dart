import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/common_button.dart';
import 'package:admin_app/features/common/common_textfield.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddOwnerCodeScreen extends StatefulWidget {
  final String apartmentName;
  final String ownerName;
  final String mobile;
  final String address;
  const AddOwnerCodeScreen({
    super.key,
    required this.apartmentName,
    required this.ownerName,
    required this.address,
    required this.mobile,
  });

  @override
  State<AddOwnerCodeScreen> createState() => _AddOwnerCodeScreenState();
}

class _AddOwnerCodeScreenState extends State<AddOwnerCodeScreen> {
  final TextEditingController _ownerCodeController = TextEditingController();
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
                                "Enter Owner Code",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),

                              CommonTextfield(
                                label: "Existing Owner Code",
                                prefixIcon: Icons.location_on,
                                hintText: "OWN-****",
                                controller: _ownerCodeController,
                                isPassword: false,
                              ),
                              CommonButton(
                                buttonName: "Skip",
                                inActiveColor: true,
                                onTap: () {
                                  // if (formKey.currentState?.validate() ??
                                  //     false) {
                                  context.go(
                                    AppRoutes.createPassword,
                                    extra: {
                                      "apartmentName": widget.apartmentName,
                                      "ownerName": widget.ownerName,
                                      "mobile": widget.mobile,
                                      "address": widget.address,
                                      "ownerCode": _ownerCodeController.text
                                          .trim(),
                                    },
                                  );
                                  // }
                                },
                              ),
                              CommonButton(
                                buttonName: "Continue",
                                onTap: () {
                                  // if (formKey.currentState?.validate() ??
                                  //     false) {
                                  context.go(
                                    AppRoutes.createPassword,
                                    extra: {
                                      "apartmentName": widget.apartmentName,
                                      "ownerName": widget.ownerName,
                                      "mobile": widget.mobile,
                                      "address": widget.address,
                                      "ownerCode": _ownerCodeController.text
                                          .trim(),
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
