import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/common/common_button.dart';
import 'package:apartment_app/features/common/common_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
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
                      "Login Here",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    CommonTextfield(
                      label: "Email ID",
                      prefixIcon: Icons.mail,
                      hintText: "example@gmail.com",
                      controller: _email,
                      isPassword: false,
                    ),
                    CommonTextfield(
                      label: "Password",
                      prefixIcon: Icons.lock,
                      hintText: "********",
                      controller: _password,
                      isPassword: true,
                    ),
                    CommonButton(
                      buttonName: "Login",
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {}
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
