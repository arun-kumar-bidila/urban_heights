import 'package:apartment_app/features/announcements/data/repository/announcement_repository_impl.dart';
import 'package:apartment_app/features/announcements/domain/repository/announcement_repository.dart';
import 'package:apartment_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:apartment_app/features/auth/domain/repository/auth_repository.dart';
import 'package:apartment_app/features/complaints/data/repository/complaint_repository_impl.dart';
import 'package:apartment_app/features/complaints/domain/repository/complaint_repository.dart';
import 'package:apartment_app/features/rooms/data/repository/room_repository_impl.dart';
import 'package:apartment_app/features/rooms/domain/repository/room_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initRepository({required GetIt sl}) async {
  /* ***************************  APARTMENT ************************/
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl()),
  );
  /* ***************************  ANNOUNCEMENT ************************/
  sl.registerLazySingleton<AnnouncementRepository>(
    () => AnnouncementRepositoryImpl(announcementDataSource: sl()),
  );

  /* ***************************  ROOMS ************************/
  sl.registerLazySingleton<RoomRepository>(
    () => RoomRepositoryImpl(roomDataSource: sl()),
  );

  /* ***************************  COMPLAINTS ************************/
  sl.registerLazySingleton<ComplaintRepository>(
    () => ComplaintRepositoryImpl(complaintDataSource: sl()),
  );
}
