part of 'login_admin_bloc.dart';

sealed class LoginAdminEvent extends Equatable {
  const LoginAdminEvent();

  @override
  List<Object> get props => [];
}

final class LoginAdmin extends LoginAdminEvent {
  final LoginAdminUseCaseParams loginAdminUseCaseParams;

  const LoginAdmin({required this.loginAdminUseCaseParams});
}
