part of 'login_apartment_bloc.dart';

sealed class LoginApartmentState extends Equatable {
  @override
  List<Object> get props => [];
}

final class LoginApartmentInitial extends LoginApartmentState {}

final class LoginApartmentLoading extends LoginApartmentState {}

final class LoginApartmentFailure extends LoginApartmentState {
  final Failure failure;

  LoginApartmentFailure({required this.failure});
}

final class LoginApartmentSuccess extends LoginApartmentState {}
