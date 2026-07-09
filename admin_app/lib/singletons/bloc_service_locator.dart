import 'package:admin_app/features/auth/presentation/bloc/login_admin/login_admin_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initBlocService({required GetIt sl}) async {
  sl.registerFactory<LoginAdminBloc>(
    () => LoginAdminBloc(loginAdminUseCase: sl()),
  );
}
