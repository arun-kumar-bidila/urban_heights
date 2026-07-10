part of 'dashboard_summary_bloc.dart';

sealed class DashboardSummaryState extends Equatable {
  @override
  List<Object> get props => [];
}

final class DashboardSummaryInitial extends DashboardSummaryState {}

final class DashboardSummaryLoading extends DashboardSummaryState {}

final class DashboardSummaryFailure extends DashboardSummaryState {
  final Failure failure;

  DashboardSummaryFailure({required this.failure});
}

final class DashboardSummarySuccess extends DashboardSummaryState {
  final SummaryEntity summaryEntity;

  DashboardSummarySuccess({required this.summaryEntity});
}
