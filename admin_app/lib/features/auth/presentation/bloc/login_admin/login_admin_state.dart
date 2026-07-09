part of 'login_admin_bloc.dart';

sealed class LoginAdminState extends Equatable {
  @override
  List<Object> get props => [];
}

final class LoginAdminInitial extends LoginAdminState {}

final class LoginAdminLoading extends LoginAdminState {}

final class LoginAdminFailure extends LoginAdminState {
  final Failure failure;

  LoginAdminFailure({required this.failure});
}

final class LoginAdminSuccess extends LoginAdminState {}
