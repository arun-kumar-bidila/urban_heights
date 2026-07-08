import 'package:admin_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardFeature extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String labelText;
  final String valueText;
  final Color iconBg;
  const DashboardFeature({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.labelText,
    required this.iconBg,
    required this.valueText,
  });

  @override
  State<DashboardFeature> createState() => _DashboardFeatureState();
}

class _DashboardFeatureState extends State<DashboardFeature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(color: Appcolors.black, blurRadius: 1.5, spreadRadius: -1),
        ],
        color: Appcolors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.iconBg,
                ),
                child: Icon(widget.icon, size: 25, color: widget.iconColor),
              ),
              SizedBox(width: 16),
              Text(
                widget.valueText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Appcolors.black,
                ),
              ),
            ],
          ),

          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Appcolors.black,
            ),
          ),
        ],
      ),
    );
  }
}
