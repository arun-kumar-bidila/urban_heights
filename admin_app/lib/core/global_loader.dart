import 'package:admin_app/config/routes/app_router_config.dart';
import 'package:admin_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GlobalLoader {
  static bool _isShowing = false;

  static Future<void> show() async {
    if (_isShowing) return;

    _isShowing = true;
    final context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                color: AppColors.stealBlue,
                borderRadius: .circular(16),
              ),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.white),
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isShowing = false;
    });
  }

  static Future<void> hide() async {
    if (!_isShowing) return;

    final navigator = navigatorKey.currentState;

    if (navigator?.canPop() ?? false) {
      navigator?.pop();
    }
    _isShowing = false;
  }

  static bool get isShowing => _isShowing;
}
