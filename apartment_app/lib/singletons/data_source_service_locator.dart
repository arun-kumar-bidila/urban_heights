import 'package:apartment_app/features/announcements/data/remote/announcement_data_source.dart';
import 'package:apartment_app/features/auth/data/remote/auth_data_source.dart';
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
  // sl.registerLazySingleton<DashboardDataSource>(
  //   () => DashboardDataSourceImpl(dio: sl(), storage: sl()),
  // );
}
