import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/auth/domain/entity/apartment_entity.dart';
import 'package:apartment_app/features/auth/domain/use_case/fetch_apartment_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_apartment_event.dart';
part 'fetch_apartment_state.dart';

class FetchApartmentBloc
    extends Bloc<FetchApartmentEvent, FetchApartmentState> {
  final FetchApartmentUseCase fetchAdminUseCase;
  FetchApartmentBloc({required this.fetchAdminUseCase})
    : super(FetchApartmentInitial()) {
    on<FetchApartment>(fetchAdmin);
    on<ResetAdminBlocEvent>(resetAdminBloc);
  }

  void fetchAdmin(
    FetchApartment event,
    Emitter<FetchApartmentState> emit,
  ) async {
    emit(FetchApartmentLoading());
    try {
      final response = await fetchAdminUseCase(NoParams());

      response.fold(
        (failure) => emit(FetchApartmentFailure(failure: failure)),
        (success) => emit(FetchApartmentSuccess(adminEntity: success)),
      );
    } catch (e) {
      emit(FetchApartmentFailure(failure: Failure()));
    }
  }

  void resetAdminBloc(
    ResetAdminBlocEvent event,
    Emitter<FetchApartmentState> emit,
  ) {
    emit(FetchApartmentInitial());
  }
}
