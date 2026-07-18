part of 'add_room_bloc.dart';

sealed class AddRoomState extends Equatable {
  const AddRoomState();

  @override
  List<Object?> get props => [];
}

final class AddRoomInitial extends AddRoomState {}

final class AddRoomLoading extends AddRoomState {}

final class AddRoomFailure extends AddRoomState {
  final Failure failure;
  const AddRoomFailure({required this.failure});
}

final class AddRoomSuccess extends AddRoomState {}
