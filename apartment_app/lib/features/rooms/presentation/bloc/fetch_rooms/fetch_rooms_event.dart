part of 'fetch_rooms_bloc.dart';

sealed class FetchRoomsEvent extends Equatable {
  const FetchRoomsEvent();

  @override
  List<Object?> get props => [];
}

final class FetchRooms extends FetchRoomsEvent {}
