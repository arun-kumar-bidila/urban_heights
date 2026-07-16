import 'package:apartment_app/features/announcements/data/repository/announcement_repository_impl.dart';
import 'package:apartment_app/features/announcements/domain/repository/announcement_repository.dart';
import 'package:apartment_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:apartment_app/features/auth/domain/repository/auth_repository.dart';
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
  // sl.registerLazySingleton<DashboardRepository>(
  //   () => DashboardRepositoryImpl(dashboardDataSource: sl()),
  // );
}
