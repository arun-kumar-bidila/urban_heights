import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/contact_info.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/family_info.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/specific_room_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecificRoomScreen extends StatefulWidget {
  final RoomEntity room;
  const SpecificRoomScreen({super.key, required this.room});

  @override
  State<SpecificRoomScreen> createState() => _SpecificRoomScreenState();
}

class _SpecificRoomScreenState extends State<SpecificRoomScreen> {
  final double divider = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: AppColors.lightBlue,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "Rooms",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SpecificRoomHeader(room: widget.room),
              ContactInfo(room: widget.room),
              SizedBox(height: 16),
              FamilyInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
