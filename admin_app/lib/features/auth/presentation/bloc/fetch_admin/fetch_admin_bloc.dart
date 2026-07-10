import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/auth/domain/entity/admin_entity.dart';
import 'package:admin_app/features/auth/domain/use_case/fetch_admin_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_admin_event.dart';
part 'fetch_admin_state.dart';

class FetchAdminBloc extends Bloc<FetchAdminEvent, FetchAdminState> {
  final FetchAdminUseCase fetchAdminUseCase;
  FetchAdminBloc({required this.fetchAdminUseCase})
    : super(FetchAdminInitial()) {
    on<FetchAdmin>(fetchAdmin);
    on<ResetAdminBlocEvent>(resetAdminBloc);
  }

  void fetchAdmin(FetchAdmin event, Emitter<FetchAdminState> emit) async {
    emit(FetchAdminLoading());
    try {
      final response = await fetchAdminUseCase(NoParams());

      response.fold(
        (failure) => emit(FetchAdminFailure(failure: failure)),
        (success) => emit(FetchAdminSuccess(adminEntity: success)),
      );
    } catch (e) {
      emit(FetchAdminFailure(failure: Failure()));
    }
  }

  void resetAdminBloc(
    ResetAdminBlocEvent event,
    Emitter<FetchAdminState> emit,
  ) {
    emit(FetchAdminInitial());
  }
}
