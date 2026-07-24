import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/rooms/domain/use_case/remove_tenant_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'remove_tenant_event.dart';
part 'remove_tenant_state.dart';

class RemoveTenantBloc extends Bloc<RemoveTenantEvent, RemoveTenantState> {
  final RemoveTenantUseCase removeTenantUseCase;
  RemoveTenantBloc({required this.removeTenantUseCase})
    : super(RemoveTenantInitial()) {
    on<RemoveTenant>(removeTenant);
  }

  void removeTenant(RemoveTenant event, Emitter<RemoveTenantState> emit) async {
    emit(RemoveTenantLoading());

    try {
      final response = await removeTenantUseCase(
        RemoveTenantUseCaseParams(tenantId: event.params.tenantId),
      );

      response.fold(
        (failure) => emit(RemoveTenantFailure(failure: failure)),
        (success) => emit(RemoveTenantSuccess()),
      );
    } catch (e) {
      emit(RemoveTenantFailure(failure: Failure()));
    }
  }
}
