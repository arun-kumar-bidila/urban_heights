import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.white, width: 1),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rooms & Tenants",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.stealBlue,
          ),
        ),
      ),
      drawer: CustomNavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                errorBorder: border,
                hintText: "Search Room....",
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.specificRoomScreen);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
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
                        crossAxisAlignment: .start,

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xFFf0f9ff),
                                    child: Text(
                                      "AK",
                                      style: TextStyle(
                                        color: AppColors.mediumBlue,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Arun Kumar",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 14,
                                            color: AppColors.grey,
                                          ),
                                          SizedBox(width: 2),
                                          Text(
                                            "A-101 • 2BHK",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: AppColors.stealBlue,
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Card(
                                elevation: 0,
                                color: AppColors.paleGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 12,
                                  ),
                                  child: Text(
                                    "paid",
                                    style: TextStyle(
                                      color: Color(0xFF007a55),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "18,000/mo • 4 members",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
