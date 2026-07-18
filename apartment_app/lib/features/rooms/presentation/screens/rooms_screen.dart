import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/core/global_loader.dart';
import 'package:apartment_app/features/common/common_button.dart';
import 'package:apartment_app/features/common/common_textfield.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_room_use_case.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/add_room/add_room_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/fetch_rooms/fetch_rooms_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/occupied_rooms.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/vacant_rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _roomTypeController = TextEditingController();
  final TextEditingController _rentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    context.read<FetchRoomsBloc>().add(FetchRooms());
  }

  void clearControllerValues() {
    _roomNumberController.clear();
    _roomTypeController.clear();
    _rentController.clear();
  }

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
        child: SingleChildScrollView(
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
              BlocBuilder<FetchRoomsBloc, FetchRoomsState>(
                builder: (context, state) {
                  if (state is FetchRoomsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.stealBlue,
                      ),
                    );
                  } else if (state is FetchRoomsFailure) {
                    // TODO IMPLEMENT FAILURE
                    return SizedBox.shrink();
                  } else if (state is FetchRoomsSuccess) {
                    final rooms = state.rooms;
                    final occupiedRooms = rooms
                        .where((room) => room.vacant == false)
                        .toList();
                    final vacantRooms = rooms
                        .where((room) => room.vacant == true)
                        .toList();

                    return Column(
                      children: [
                        OccupiedRooms(occupiedRooms: occupiedRooms),
                        VacantRooms(vacantRooms: vacantRooms),
                      ],
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(16.0),
          child: CommonButton(
            buttonName: "Add Room",
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
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
                      child: BlocListener<AddRoomBloc, AddRoomState>(
                        listener: (context, state) {
                          if (state is AddRoomLoading) {
                            GlobalLoader.show();
                          } else if (state is AddRoomFailure) {
                            if (GlobalLoader.isShowing) {
                              GlobalLoader.hide();
                            }
                            // context.pop();
                            // TODO IMPLEMENT FAILURE
                          } else if (state is AddRoomSuccess) {
                            if (GlobalLoader.isShowing) {
                              GlobalLoader.hide();
                            }
                            context.pop();
                            context.read<FetchRoomsBloc>().add(FetchRooms());
                            clearControllerValues();
                          }
                        },
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add Room",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.stealBlue,
                                ),
                              ),
                              SizedBox(height: 24),
                              CommonTextfield(
                                label: "Room Number",
                                prefixIcon: Icons.room,
                                hintText: "A-101",
                                controller: _roomNumberController,
                                isPassword: false,
                              ),
                              SizedBox(height: 16),
                              CommonTextfield(
                                label: "Room Type",
                                prefixIcon: Icons.apartment,
                                hintText: "2 BHK",
                                controller: _roomTypeController,
                                isPassword: false,
                              ),

                              SizedBox(height: 16),
                              CommonTextfield(
                                label: "Rent Details",
                                prefixIcon: Icons.currency_rupee,
                                hintText: "18000",
                                controller: _rentController,
                                isPassword: false,
                              ),

                              SizedBox(height: 24),
                              CommonButton(
                                buttonName: "Create",
                                onTap: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<AddRoomBloc>().add(
                                      AddRoom(
                                        params: AddRoomUseCaseParams(
                                          roomNumber: _roomNumberController.text
                                              .trim(),
                                          roomType: _roomTypeController.text
                                              .trim(),
                                          roomRent:
                                              int.tryParse(
                                                _rentController.text.trim(),
                                              ) ??
                                              0,
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
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
