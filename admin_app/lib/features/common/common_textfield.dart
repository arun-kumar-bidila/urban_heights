import 'package:admin_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatefulWidget {
  final String label;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const CommonTextfield({
    super.key,
    required this.label,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.isPassword,
  });

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  final _border = InputBorder.none;
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
              color: Appcolors.black,
            ),
            children: [
              TextSpan(
                text: "*",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Appcolors.red,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: Appcolors.black),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.prefixIcon, size: 20, color: Appcolors.grey),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  cursorColor: Appcolors.stealBlue,
                  obscureText: obscureText,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: .zero,
                    enabledBorder: _border,
                    focusedBorder: _border,
                    errorBorder: _border,
                    border: _border,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Appcolors.grey,
                    ),
                  ),
                ),
              ),
              if (widget.isPassword) ...[
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    size: 20,
                    color: Appcolors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
