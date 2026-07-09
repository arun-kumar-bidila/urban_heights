import 'package:admin_app/config/routes/app_router_config.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:admin_app/core/enums.dart';
import 'package:flutter/material.dart';

class CustomToast {
  static bool _isShowing = false;

  static Future<void> show({
    required String message,
    required ToastType type,
    Duration duration = const Duration(seconds: 3),
  }) async {
    if (_isShowing) return;

    final context = navigatorKey.currentContext;
    if (context == null) return;

    _isShowing = true;

    final isSuccess = type == ToastType.success;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Material(
          color: Colors.transparent,
          child: PopScope(
            canPop: false,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),

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
                      radius: 35,
                      child: Icon(
                        isSuccess ? Icons.check_circle : Icons.error,
                        color: isSuccess ? AppColors.emerald : AppColors.red,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 16),
                    Flexible(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    await Future.delayed(duration);

    if (_isShowing && (navigatorKey.currentState?.canPop() ?? false)) {
      navigatorKey.currentState?.pop();
    }

    _isShowing = false;
  }

  // static bool get isShowing => _isShowing;
}
