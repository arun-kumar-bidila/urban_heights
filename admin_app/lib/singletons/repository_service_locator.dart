import 'package:admin_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:admin_app/features/auth/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initRepository({required GetIt sl}) async {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl()),
  );
}
