import 'package:apartment_app/features/announcements/presentation/bloc/delete_announcement/delete_announcement_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/fetch_announcements/fetch_announcements_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/update_announcement/update_announcement_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/login_apartment/login_apartment_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/add_room/add_room_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/add_tenant/add_tenant_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/fetch_rooms/fetch_rooms_bloc.dart';
import 'package:apartment_app/singletons/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocManager {
  static MultiBlocProvider provider({
    required BuildContext context,
    required Widget child,
  }) {
    return MultiBlocProvider(
      providers: [
        /* ***************************  APARTMENT ************************/
        BlocProvider(
          create: (BuildContext context) => sl<LoginApartmentBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<FetchApartmentBloc>(),
        ),

        /* ***************************  ANNOUNCEMENT ************************/
        BlocProvider(
          create: (BuildContext context) => sl<FetchAnnouncementsBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<DeleteAnnouncementBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<UpdateAnnouncementBloc>(),
        ),

        /* ***************************  ROOMS ************************/
        BlocProvider(create: (BuildContext context) => sl<FetchRoomsBloc>()),
        BlocProvider(create: (BuildContext context) => sl<AddTenantBloc>()),
        BlocProvider(create: (BuildContext context) => sl<AddRoomBloc>()),
      ],
      child: child,
    );
  }
}
