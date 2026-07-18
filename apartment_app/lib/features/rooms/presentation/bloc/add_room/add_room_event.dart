part of 'add_room_bloc.dart';

sealed class AddRoomEvent extends Equatable {
  const AddRoomEvent();

  @override
  List<Object?> get props => [];
}

final class AddRoom extends AddRoomEvent {
  final AddRoomUseCaseParams params;

  const AddRoom({required this.params});
}
