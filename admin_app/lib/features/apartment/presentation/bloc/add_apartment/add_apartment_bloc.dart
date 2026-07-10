import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/use_case/add_apartment_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_apartment_event.dart';
part 'add_apartment_state.dart';

class AddApartmentBloc extends Bloc<AddApartmentEvent, AddApartmentState> {
  final AddApartmentUseCase addApartmentUseCase;
  AddApartmentBloc({required this.addApartmentUseCase})
    : super(AddApartmentInitial()) {
    on<AddApartment>(addApartment);
  }

  void addApartment(AddApartment event, Emitter<AddApartmentState> emit) async {
    emit(AddApartmentLoading());
    try {
      final response = await addApartmentUseCase(
        AddApartmentUseCaseParams(
          apartmentName: event.params.apartmentName,
          ownerName: event.params.ownerName,
          ownerCode: event.params.ownerCode,
          address: event.params.address,
          password: event.params.password,
          ownerMobile: event.params.ownerMobile,
        ),
      );

      response.fold(
        (failure) => emit(AddApartmentFailure(failure: failure)),
        (success) => emit(AddApartmentSuccess(apartmentEntity: success)),
      );
    } catch (e) {
      emit(AddApartmentFailure(failure: Failure()));
    }
  }
}
