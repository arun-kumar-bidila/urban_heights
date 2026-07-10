import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/apartment/domain/entity/apartment_entity.dart';
import 'package:admin_app/features/apartment/domain/use_case/fetch_all_apartments_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_all_apartments_event.dart';
part 'fetch_all_apartments_state.dart';

class FetchAllApartmentsBloc
    extends Bloc<FetchAllApartmentsEvent, FetchAllApartmentsState> {
  final FetchAllApartmentsUseCase fetchAllApartmentsUseCase;
  FetchAllApartmentsBloc({required this.fetchAllApartmentsUseCase})
    : super(FetchAllApartmentsInitial()) {
    on<FetchAllApartments>(fetchAllApartments);
  }
  void fetchAllApartments(
    FetchAllApartments event,
    Emitter<FetchAllApartmentsState> emit,
  ) async {
    emit(FetchAllApartmentsLoading());
    try {
      final response = await fetchAllApartmentsUseCase(NoParams());

      response.fold(
        (failure) => emit(FetchAllApartmentsFailure(failure: failure)),
        (success) => emit(FetchAllApartmentsSuccess(allApartments: success)),
      );
    } catch (e) {
      emit(FetchAllApartmentsFailure(failure: Failure()));
    }
  }
}
