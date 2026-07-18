import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/rooms/domain/use_case/add_room_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_room_event.dart';
part 'add_room_state.dart';

class AddRoomBloc extends Bloc<AddRoomEvent, AddRoomState> {
  final AddRoomUseCase addRoomUseCase;
  AddRoomBloc({required this.addRoomUseCase}) : super(AddRoomInitial()) {
    on<AddRoom>(addRoom);
  }
  void addRoom(AddRoom event, Emitter<AddRoomState> emit) async {
    emit(AddRoomLoading());
    try {
      final response = await addRoomUseCase(
        AddRoomUseCaseParams(
          roomNumber: event.params.roomNumber,
          roomType: event.params.roomType,
          roomRent: event.params.roomRent,
        ),
      );

      response.fold(
        (failure) => emit(AddRoomFailure(failure: (failure))),
        (success) => emit(AddRoomSuccess()),
      );
    } catch (e) {
      emit(AddRoomFailure(failure: Failure()));
    }
  }
}
