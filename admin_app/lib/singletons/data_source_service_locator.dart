import 'package:admin_app/features/apartment/data/remote/apartment_data_source.dart';
import 'package:admin_app/features/auth/data/remote/auth_data_source.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataSources({required GetIt sl}) async {
  /* ***************************  ADMIN ************************/
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(dio: sl(), storage: sl()),
  );
  /* ***************************  APARTMENT ************************/
  sl.registerLazySingleton<ApartmentDataSource>(
    () => ApartmentDataSourceImpl(dio: sl(), storage: sl()),
  );
}
