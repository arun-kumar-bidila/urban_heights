import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:flutter/material.dart';

class SpecificRoomHeader extends StatelessWidget {
  final RoomEntity room;
  const SpecificRoomHeader({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final double divider = 0.5;
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(room.tenant!.fullName),
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
                            "${room.roomNumber.toUpperCase()} • ${room.roomType.toUpperCase()}",

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
              SizedBox(height: 16),
              Container(
                height: divider,
                decoration: BoxDecoration(color: AppColors.grey),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        formatRent(room.rent),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Rent",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    decoration: BoxDecoration(color: AppColors.grey),
                  ),
                  Column(
                    children: [
                      Text(
                        "04",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Members",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    decoration: BoxDecoration(color: AppColors.grey),
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 0,
                        color: room.rentStatus
                            ? AppColors.paleGreen
                            : AppColors.paleRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Text(
                            room.rentStatus ? "paid" : "unpaid",
                            style: TextStyle(
                              fontSize: 12,
                              color: room.rentStatus
                                  ? Color(0xFF007a55)
                                  : AppColors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Status",
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
        ),
      ],
    );
  }
}
