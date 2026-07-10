import 'package:admin_app/core/failure.dart';
import 'package:admin_app/core/use_case.dart';
import 'package:admin_app/features/dashboard/domain/entity/summary_entity.dart';
import 'package:admin_app/features/dashboard/domain/use_case/dashboard_summary_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_summary_event.dart';
part 'dashboard_summary_state.dart';

class DashboardSummaryBloc
    extends Bloc<DashboardSummaryEvent, DashboardSummaryState> {
  final DashboardSummaryUseCase dashboardSummaryUseCase;
  DashboardSummaryBloc({required this.dashboardSummaryUseCase})
    : super(DashboardSummaryInitial()) {
    on<DashboardSummary>(fetchSummary);
  }

  void fetchSummary(
    DashboardSummary event,
    Emitter<DashboardSummaryState> emit,
  ) async {
    emit(DashboardSummaryLoading());
    try {
      final response = await dashboardSummaryUseCase(NoParams());

      response.fold(
        (failure) => emit(DashboardSummaryFailure(failure: failure)),
        (success) => emit(DashboardSummarySuccess(summaryEntity: success)),
      );
    } catch (e) {
      emit(DashboardSummaryFailure(failure: Failure()));
    }
  }
}
