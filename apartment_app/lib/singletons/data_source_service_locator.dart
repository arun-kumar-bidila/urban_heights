import 'package:apartment_app/features/announcements/data/remote/announcement_data_source.dart';
import 'package:apartment_app/features/auth/data/remote/auth_data_source.dart';
import 'package:apartment_app/features/complaints/data/remote/complaint_data_source.dart';
import 'package:apartment_app/features/rooms/data/remote/room_data_source.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataSources({required GetIt sl}) async {
  /* ***************************  APARTMENT ************************/
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(dio: sl(), storage: sl()),
  );
  /* ***************************  ANNOUNCEMENT ************************/
  sl.registerLazySingleton<AnnouncementDataSource>(
    () => AnnouncementDataSourceImpl(dio: sl(), storage: sl()),
  );

  /* ***************************  ROOMS ************************/
  sl.registerLazySingleton<RoomDataSource>(
    () => RoomDataSourceImpl(dio: sl(), storage: sl()),
  );

  /* ***************************  COMPLAINTS ************************/
  sl.registerLazySingleton<ComplaintDataSource>(
    () => ComplaintDataSourceImpl(dio: sl(), storage: sl()),
  );
}
