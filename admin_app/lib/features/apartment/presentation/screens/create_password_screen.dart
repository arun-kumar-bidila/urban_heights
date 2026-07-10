import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/core/custom_toast.dart';
import 'package:admin_app/core/enums.dart';
import 'package:admin_app/core/global_loader.dart';
import 'package:admin_app/features/apartment/domain/use_case/add_apartment_use_case.dart';
import 'package:admin_app/features/apartment/presentation/bloc/add_apartment/add_apartment_bloc.dart';
import 'package:flutter/material.dart';

import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/features/common/common_button.dart';
import 'package:admin_app/features/common/common_textfield.dart';
import 'package:admin_app/features/common/navigation_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String apartmentName;
  final String ownerName;
  final String mobile;
  final String address;
  final String ownerCode;
  const CreatePasswordScreen({
    super.key,
    required this.apartmentName,
    required this.ownerName,
    required this.address,
    required this.mobile,
    required this.ownerCode,
  });

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isPasswordsMatch() {
    return _newPassword.text == _confirmPassword.text;
  }

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
                  child: BlocListener<AddApartmentBloc, AddApartmentState>(
                    listener: (context, state) {
                      if (state is AddApartmentLoading) {
                        GlobalLoader.show();
                      } else if (state is AddApartmentFailure) {
                        if (GlobalLoader.isShowing) {
                          GlobalLoader.hide();
                        }
                        CustomToast.show(
                          message: state.failure.message,
                          type: ToastType.error,
                        );
                      } else if (state is AddApartmentSuccess) {
                        if (GlobalLoader.isShowing) {
                          GlobalLoader.hide();
                        }
                        context.go(
                          AppRoutes.apartmentCreationSuccessScreen,
                          extra: _newPassword.text.trim(),
                        );
                      }
                    },
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
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      if (_isPasswordsMatch()) {
                                        context.read<AddApartmentBloc>().add(
                                          AddApartment(
                                            params: AddApartmentUseCaseParams(
                                              apartmentName:
                                                  widget.apartmentName,
                                              ownerName: widget.ownerName,
                                              ownerCode: widget.ownerCode,
                                              address: widget.address,
                                              password: _newPassword.text
                                                  .trim(),
                                              ownerMobile: widget.mobile,
                                            ),
                                          ),
                                        );
                                      } else {
                                        CustomToast.show(
                                          message: "Passwords do not Match",
                                          type: ToastType.error,
                                        );
                                      }
                                    }
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
            ),
          ],
        ),
      ),
    );
  }
}
