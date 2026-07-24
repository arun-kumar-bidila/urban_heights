import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/custom_toast.dart';
import 'package:apartment_app/core/enums.dart';
import 'package:apartment_app/core/global_loader.dart';
import 'package:apartment_app/features/common/common_button.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:apartment_app/features/rooms/domain/use_case/remove_tenant_use_case.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/fetch_rooms/fetch_rooms_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/remove_tenant/remove_tenant_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/contact_info.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/family_info.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/specific_room_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: BlocListener<RemoveTenantBloc, RemoveTenantState>(
            listener: (context, state) {
              if (state is RemoveTenantLoading) {
                GlobalLoader.show();
              } else if (state is RemoveTenantFailure) {
                if (GlobalLoader.isShowing) {
                  GlobalLoader.hide();
                }
                context.pop();
                CustomToast.show(
                  message: state.failure.message,
                  type: ToastType.error,
                );
                //TODO IMPLEMENT FAILURE
              } else if (state is RemoveTenantSuccess) {
                context.read<FetchRoomsBloc>().add(FetchRooms());
                if (GlobalLoader.isShowing) {
                  GlobalLoader.hide();
                }
                context.go(AppRoutes.rooms);
              }
            },
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
                SizedBox(height: 16),
                CommonButton(
                  buttonName: "Remove Tenant",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          title: Text(
                            "Remove Tenant",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.stealBlue,
                            ),
                          ),
                          content: Text(
                            "Are you sure, you want to remove tenant?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.stealBlue,
                            ),
                          ),

                          actions: [
                            Text(
                              "Cancel",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.stealBlue,
                              ),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                context.read<RemoveTenantBloc>().add(
                                  RemoveTenant(
                                    params: RemoveTenantUseCaseParams(
                                      tenantId: widget.room.tenant!.tenantId,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.paleRed,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  "Remove",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
