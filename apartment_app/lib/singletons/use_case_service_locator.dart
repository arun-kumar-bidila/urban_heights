import 'package:apartment_app/features/auth/domain/use_case/fetch_apartment_use_case.dart';
import 'package:apartment_app/features/auth/domain/use_case/login_apartment_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> initUseCase({required GetIt sl}) async {
  /* ***************************  ADMIN ************************/
  sl.registerFactory<LoginApartmentUseCase>(
    () => LoginApartmentUseCase(authRepository: sl()),
  );
  sl.registerFactory<FetchApartmentUseCase>(
    () => FetchApartmentUseCase(authRepository: sl()),
  );

  /* ***************************  APARTMENT ************************/
}
