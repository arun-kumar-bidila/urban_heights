import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/common/navigation_drawer.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/fetch_rooms/fetch_rooms_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/occupied_rooms.dart';
import 'package:apartment_app/features/rooms/presentation/widgets/vacant_rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FetchRoomsBloc>().add(FetchRooms());
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
    );
  }
}
