import 'package:apartment_app/features/announcements/presentation/bloc/delete_announcement/delete_announcement_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/fetch_announcements/fetch_announcements_bloc.dart';
import 'package:apartment_app/features/announcements/presentation/bloc/update_announcement/update_announcement_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/login_apartment/login_apartment_bloc.dart';
import 'package:apartment_app/features/complaints/presentation/bloc/fetch_complaint/fetch_complaint_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/add_room/add_room_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/add_tenant/add_tenant_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/fetch_rooms/fetch_rooms_bloc.dart';
import 'package:apartment_app/features/rooms/presentation/bloc/room_summary/room_summary_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initBlocService({required GetIt sl}) async {
  /* ***************************  APARTMENT ************************/
  sl.registerFactory<LoginApartmentBloc>(
    () => LoginApartmentBloc(loginApartmentUseCase: sl()),
  );
  sl.registerFactory<FetchApartmentBloc>(
    () => FetchApartmentBloc(fetchAdminUseCase: sl()),
  );
  // /* ***************************  APARTMENT ************************/
  sl.registerFactory<FetchAnnouncementsBloc>(
    () => FetchAnnouncementsBloc(fetchAnnouncementsUseCase: sl()),
  );
  sl.registerFactory<DeleteAnnouncementBloc>(
    () => DeleteAnnouncementBloc(deleteAnnouncementUseCase: sl()),
  );
  sl.registerFactory<UpdateAnnouncementBloc>(
    () => UpdateAnnouncementBloc(updateAnnouncementUseCase: sl()),
  );

  /* ***************************  ROOMS ************************/
  sl.registerFactory<FetchRoomsBloc>(
    () => FetchRoomsBloc(fetchRoomsUseCase: sl()),
  );
  sl.registerFactory<AddTenantBloc>(
    () => AddTenantBloc(addTenantUseCase: sl()),
  );
  sl.registerFactory<AddRoomBloc>(() => AddRoomBloc(addRoomUseCase: sl()));
  sl.registerFactory<RoomSummaryBloc>(
    () => RoomSummaryBloc(fetchRoomSummaryUseCase: sl()),
  );

  /* ***************************  COMPLAINTS ************************/
  sl.registerFactory<FetchComplaintBloc>(
    () => FetchComplaintBloc(fetchComplaintsUseCase: sl()),
  );
}
