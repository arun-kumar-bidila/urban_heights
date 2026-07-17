import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class VacantRooms extends StatelessWidget {
  final List<RoomEntity> vacantRooms;
  const VacantRooms({super.key, required this.vacantRooms});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vacantRooms.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final room = vacantRooms[index];
        return GestureDetector(
          onTap: () {
            context.push(AppRoutes.addTenantScreen, extra: room);
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
                            "V",
                            style: TextStyle(
                              color: AppColors.mediumBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.roomNumber,
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
                                  room.roomType,
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
                SizedBox(height: 12),
                Row(
                  children: [
                    Card(
                      elevation: 0,
                      color: AppColors.paleYellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12,
                        ),
                        child: Text(
                          "vacant",
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "${formatRent(room.rent)} /month",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    // Text(
                    //   "",
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColors.black,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
