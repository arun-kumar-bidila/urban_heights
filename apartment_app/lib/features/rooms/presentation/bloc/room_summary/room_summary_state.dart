part of 'room_summary_bloc.dart';

sealed class RoomSummaryState extends Equatable {
  const RoomSummaryState();

  @override
  List<Object?> get props => [];
}

final class RoomSummaryInitial extends RoomSummaryState {}

final class RoomSummaryLoading extends RoomSummaryState {}

final class RoomSummaryFailure extends RoomSummaryState {
  final Failure failure;

  const RoomSummaryFailure({required this.failure});
}

final class RoomSummarySuccess extends RoomSummaryState {
  final RoomSummaryEntity roomSummary;

  const RoomSummarySuccess({required this.roomSummary});
}
