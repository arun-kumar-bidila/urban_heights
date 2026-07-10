import 'package:admin_app/features/apartment/data/repository/apartment_repository_impl.dart';
import 'package:admin_app/features/apartment/domain/repository/apartment_repository.dart';
import 'package:admin_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:admin_app/features/auth/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initRepository({required GetIt sl}) async {
  /* ***************************  ADMIN ************************/
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl()),
  );
  /* ***************************  APARTMENT ************************/
  sl.registerLazySingleton<ApartmentRepository>(
    () => ApartmentRepositoryImpl(apartmentDataSource: sl()),
  );
}
