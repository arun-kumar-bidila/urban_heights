import 'package:apartment_app/features/announcements/domain/use_case/delete_announcement_use_case.dart';
import 'package:apartment_app/features/announcements/domain/use_case/fetch_announcements_use_case.dart';
import 'package:apartment_app/features/announcements/domain/use_case/update_announcement_use_case.dart';

import 'package:apartment_app/features/auth/domain/use_case/fetch_apartment_use_case.dart';
import 'package:apartment_app/features/auth/domain/use_case/login_apartment_use_case.dart';
import 'package:apartment_app/features/complaints/domain/use_case/fetch_complaints_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_room_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_tenant_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/fetch_room_summary_use_case.dart';
import 'package:apartment_app/features/rooms/domain/use_case/fetch_rooms_use_case.dart';

import 'package:get_it/get_it.dart';

Future<void> initUseCase({required GetIt sl}) async {
  /* ***************************  APARTMENT ************************/
  sl.registerFactory<LoginApartmentUseCase>(
    () => LoginApartmentUseCase(authRepository: sl()),
  );
  sl.registerFactory<FetchApartmentUseCase>(
    () => FetchApartmentUseCase(authRepository: sl()),
  );

  /* ***************************  ANNOUNCEMENT ************************/

  sl.registerFactory<FetchAnnouncementsUseCase>(
    () => FetchAnnouncementsUseCase(announcementRepository: sl()),
  );
  sl.registerFactory<DeleteAnnouncementUseCase>(
    () => DeleteAnnouncementUseCase(announcementRepository: sl()),
  );
  sl.registerFactory<UpdateAnnouncementUseCase>(
    () => UpdateAnnouncementUseCase(announcementRepository: sl()),
  );

  // /* ***************************  ROOMS ************************/
  sl.registerFactory<FetchRoomsUseCase>(
    () => FetchRoomsUseCase(roomRepository: sl()),
  );
  sl.registerFactory<AddTenantUseCase>(
    () => AddTenantUseCase(roomRepository: sl()),
  );
  sl.registerFactory<AddRoomUseCase>(
    () => AddRoomUseCase(roomRepository: sl()),
  );
  sl.registerFactory<FetchRoomSummaryUseCase>(
    () => FetchRoomSummaryUseCase(roomRepository: sl()),
  );

  // /* ***************************  COMPLAINTS ************************/
  sl.registerFactory<FetchComplaintsUseCase>(
    () => FetchComplaintsUseCase(complaintRepository: sl()),
  );
}
