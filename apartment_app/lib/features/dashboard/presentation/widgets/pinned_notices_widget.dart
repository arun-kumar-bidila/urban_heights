import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PinnedNoticesWidget extends StatefulWidget {
  const PinnedNoticesWidget({super.key});

  @override
  State<PinnedNoticesWidget> createState() => _PinnedNoticesWidgetState();
}

class _PinnedNoticesWidgetState extends State<PinnedNoticesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "PINNED NOTICES",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.stealBlue,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFf0f9ff),
                  border: Border.all(width: 0.5, color: AppColors.lightBlue),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.push_pin,
                              size: 15,
                              color: AppColors.lightBlue,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "30 July",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "July Rent Reminder",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Navy gradient hero card with owner avatar, name, verified badge, and 3 quick stats (rooms / occupied / collected)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
