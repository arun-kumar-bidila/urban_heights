import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/auth/domain/use_case/login_admin_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_admin_event.dart';
part 'login_admin_state.dart';

class LoginAdminBloc extends Bloc<LoginAdminEvent, LoginAdminState> {
  final LoginAdminUseCase loginAdminUseCase;
  LoginAdminBloc({required this.loginAdminUseCase})
    : super(LoginAdminInitial()) {
    on<LoginAdmin>(loginAdmin);
  }

  void loginAdmin(LoginAdmin event, Emitter<LoginAdminState> emit) async {
    emit(LoginAdminLoading());
    try {
      final response = await loginAdminUseCase(
        LoginAdminUseCaseParams(
          email: event.loginAdminUseCaseParams.email,
          password: event.loginAdminUseCaseParams.password,
        ),
      );

      response.fold(
        (failure) => emit(LoginAdminFailure(failure: failure)),
        (success) => emit(LoginAdminSuccess()),
      );
    } catch (e) {
      emit(LoginAdminFailure(failure: Failure()));
    }
  }
}
