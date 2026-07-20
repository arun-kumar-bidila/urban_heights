import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/custom_toast.dart';
import 'package:apartment_app/core/enums.dart';
import 'package:apartment_app/core/global_loader.dart';
import 'package:apartment_app/core/utils.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:apartment_app/features/common/common_button.dart';
import 'package:apartment_app/features/common/common_textfield.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_tenant_use_case.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/add_tenant/add_tenant_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/fetch_rooms/fetch_rooms_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTenantScreen extends StatefulWidget {
  final RoomEntity room;
  const AddTenantScreen({super.key, required this.room});

  @override
  State<AddTenantScreen> createState() => _AddTenantScreenState();
}

class _AddTenantScreenState extends State<AddTenantScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? apartmentName;

  @override
  void initState() {
    super.initState();
    final apartmentState = context.read<FetchApartmentBloc>().state;
    if (apartmentState is FetchApartmentSuccess) {
      apartmentName = apartmentState.apartmentEntity.apartmentName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocListener<AddTenantBloc, AddTenantState>(
                  listener: (context, state) {
                    if (state is AddTenantLoading) {
                      GlobalLoader.show();
                    } else if (state is AddTenantFailure) {
                      if (GlobalLoader.isShowing) {
                        GlobalLoader.hide();
                      }
                      CustomToast.show(
                        message: state.failure.message,
                        type: ToastType.error,
                      );
                    } else if (state is AddTenantSuccess) {
                      if (GlobalLoader.isShowing) {
                        GlobalLoader.hide();
                      }
                      context.read<FetchRoomsBloc>().add(FetchRooms());
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.room.roomNumber,
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
                                              widget.room.roomType
                                                  .toUpperCase(),

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
                                Column(
                                  children: [
                                    Text(
                                      formatRent(widget.room.rent),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.emerald,
                                      ),
                                    ),
                                    SizedBox(height: 6),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Contact Info",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 16),
                              CommonTextfield(
                                label: "Tenant Name",
                                prefixIcon: Icons.person,
                                hintText: "Arun Kumar",
                                controller: _fullNameController,
                                isPassword: false,
                              ),
                              SizedBox(height: 16),
                              CommonTextfield(
                                label: "Mobile",
                                prefixIcon: Icons.phone,
                                hintText: "+91 1234567890",
                                controller: _mobileController,
                                isPassword: false,
                              ),
                              SizedBox(height: 16),
                              CommonTextfield(
                                label: "Email",
                                prefixIcon: Icons.mail,
                                hintText: "example@gmail.com",
                                controller: _emailController,
                                isPassword: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      CommonButton(
                        buttonName: "Add Tenant",
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<AddTenantBloc>().add(
                              AddTenant(
                                addTenantUseCaseParams: AddTenantUseCaseParams(
                                  fullName: _fullNameController.text.trim(),
                                  mobile: _mobileController.text.trim(),
                                  email: _emailController.text.trim(),
                                  roomNumber: widget.room.roomNumber,
                                  roomType: widget.room.roomType,
                                  roomId: widget.room.roomId,
                                  apartmentName: apartmentName!,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
