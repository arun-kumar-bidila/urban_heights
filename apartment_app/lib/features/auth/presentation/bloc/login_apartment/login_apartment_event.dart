part of 'login_apartment_bloc.dart';

sealed class LoginApartmentEvent extends Equatable {
  const LoginApartmentEvent();

  @override
  List<Object> get props => [];
}

final class LoginApartment extends LoginApartmentEvent {
  final LoginApartmentUseCaseParams loginApartmentUseCaseParams;

  const LoginApartment({required this.loginApartmentUseCaseParams});
}
