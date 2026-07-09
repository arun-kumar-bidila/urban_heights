import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> initUseCase({required GetIt sl}) async {
  sl.registerFactory<LoginAdminUseCase>(
    () => LoginAdminUseCase(authRepository: sl()),
  );
}
