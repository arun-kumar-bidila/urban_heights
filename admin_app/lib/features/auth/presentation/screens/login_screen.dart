import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/core/custom_toast.dart';
import 'package:admin_app/core/enums.dart';
import 'package:admin_app/core/global_loader.dart';
import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:admin_app/features/auth/presentation/bloc/login_admin/login_admin_bloc.dart';
import 'package:admin_app/features/common/common_button.dart';
import 'package:admin_app/features/common/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        child: BlocListener<LoginAdminBloc, LoginAdminState>(
          listener: (context, state) {
            if (state is LoginAdminLoading) {
              GlobalLoader.show();
            } else if (state is LoginAdminFailure) {
              if (GlobalLoader.isShowing) {
                GlobalLoader.hide();
              }
              CustomToast.show(
                message: state.failure.message,
                type: ToastType.success,
              );
            } else if (state is LoginAdminSuccess) {
              if (GlobalLoader.isShowing) {
                GlobalLoader.hide();
              }
              context.go(AppRoutes.dashboard);
            }
          },
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
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<LoginAdminBloc>().add(
                              LoginAdmin(
                                loginAdminUseCaseParams:
                                    LoginAdminUseCaseParams(
                                      email: _email.text.trim(),
                                      password: _password.text.trim(),
                                    ),
                              ),
                            );
                          }
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
    );
  }
}
