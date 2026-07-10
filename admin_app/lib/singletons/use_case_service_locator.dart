import 'package:admin_app/features/apartment/domain/use_case/add_apartment_use_case.dart';

import 'package:admin_app/features/auth/domain/use_case/fetch_admin_use_case.dart';
import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> initUseCase({required GetIt sl}) async {
  /* ***************************  ADMIN ************************/
  sl.registerFactory<LoginAdminUseCase>(
    () => LoginAdminUseCase(authRepository: sl()),
  );
  sl.registerFactory<FetchAdminUseCase>(
    () => FetchAdminUseCase(authRepository: sl()),
  );

  /* ***************************  APARTMENT ************************/
  sl.registerFactory<AddApartmentUseCase>(
    () => AddApartmentUseCase(apartmentRepository: sl()),
  );
}
