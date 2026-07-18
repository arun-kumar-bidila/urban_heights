part of 'room_summary_bloc.dart';

sealed class RoomSummaryEvent extends Equatable {
  const RoomSummaryEvent();

  @override
  List<Object?> get props => [];
}

final class RoomSummary extends RoomSummaryEvent {}
