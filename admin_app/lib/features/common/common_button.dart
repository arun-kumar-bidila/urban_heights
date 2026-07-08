import 'package:admin_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  final String buttonName;
  final VoidCallback onTap;
  const CommonButton({
    super.key,
    required this.buttonName,
    required this.onTap,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Appcolors.stealBlue,
        ),
        child: Center(
          child: Text(
            widget.buttonName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Appcolors.white,
            ),
          ),
        ),
      ),
    );
  }
}
