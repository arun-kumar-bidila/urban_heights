import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/auth/domain/use_case/login_apartment_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_apartment_event.dart';
part 'login_apartment_state.dart';

class LoginApartmentBloc
    extends Bloc<LoginApartmentEvent, LoginApartmentState> {
  final LoginApartmentUseCase loginApartmentUseCase;
  LoginApartmentBloc({required this.loginApartmentUseCase})
    : super(LoginApartmentInitial()) {
    on<LoginApartment>(loginApartment);
  }

  void loginApartment(
    LoginApartment event,
    Emitter<LoginApartmentState> emit,
  ) async {
    emit(LoginApartmentLoading());
    try {
      final response = await loginApartmentUseCase(
        LoginApartmentUseCaseParams(
          apartmentCode: event.loginApartmentUseCaseParams.apartmentCode,
          password: event.loginApartmentUseCaseParams.password,
        ),
      );

      response.fold(
        (failure) => emit(LoginApartmentFailure(failure: failure)),
        (success) => emit(LoginApartmentSuccess()),
      );
    } catch (e) {
      emit(LoginApartmentFailure(failure: Failure()));
    }
  }
}
