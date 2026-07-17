part of 'fetch_rooms_bloc.dart';

sealed class FetchRoomsState extends Equatable {
  const FetchRoomsState();

  @override
  List<Object?> get props => [];
}

final class FetchRoomsInitial extends FetchRoomsState {}

final class FetchRoomsLoading extends FetchRoomsState {}

final class FetchRoomsFailure extends FetchRoomsState {
  final Failure failure;

  const FetchRoomsFailure({required this.failure});
}

final class FetchRoomsSuccess extends FetchRoomsState {
  final List<RoomEntity> rooms;

  const FetchRoomsSuccess({required this.rooms});
}
