import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_tenant_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_tenant_event.dart';
part 'add_tenant_state.dart';

class AddTenantBloc extends Bloc<AddTenantEvent, AddTenantState> {
  final AddTenantUseCase addTenantUseCase;

  AddTenantBloc({required this.addTenantUseCase}) : super(AddTenantInitial()) {
    on<AddTenant>(addTenant);
  }

  void addTenant(AddTenant event, Emitter<AddTenantState> emit) async {
    emit(AddTenantLoading());
    try {
      final response = await addTenantUseCase(
        AddTenantUseCaseParams(
          fullName: event.addTenantUseCaseParams.fullName,
          mobile: event.addTenantUseCaseParams.mobile,
          email: event.addTenantUseCaseParams.email,
          roomId: event.addTenantUseCaseParams.roomId,
        ),
      );

      response.fold(
        (failure) => emit(AddTenantFailure(failure: (failure))),
        (success) => emit(AddTenantSuccess()),
      );
    } catch (e) {
      emit(AddTenantFailure(failure: Failure()));
    }
  }
}
