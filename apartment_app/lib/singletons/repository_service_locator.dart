import 'package:apartment_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:apartment_app/features/auth/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initRepository({required GetIt sl}) async {
  /* ***************************  ADMIN ************************/
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl()),
  );
  /* ***************************  APARTMENT ************************/
  // sl.registerLazySingleton<ApartmentRepository>(
  //   () => ApartmentRepositoryImpl(apartmentDataSource: sl()),
  // );
  // sl.registerLazySingleton<DashboardRepository>(
  //   () => DashboardRepositoryImpl(dashboardDataSource: sl()),
  // );
}
