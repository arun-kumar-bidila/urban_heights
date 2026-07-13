import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final int minLines;

  const CommonTextfield({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    this.minLines = 1,
  });

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: AppColors.grey, width: 1),
  );
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "${widget.label} ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            children: [
              TextSpan(
                text: "*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),

        TextFormField(
          cursorColor: AppColors.stealBlue,
          obscureText: widget.isPassword ? obscureText : false,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              size: 20,
              color: AppColors.grey,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  )
                : null,
            contentPadding: .zero,
            enabledBorder: _border,
            focusedBorder: _border,
            errorBorder: _border,
            border: _border,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "*Required";
            }
            return null;
          },
        ),
      ],
    );
  }
}
