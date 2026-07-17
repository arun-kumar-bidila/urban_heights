import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_entity.dart';
import 'package:apartment_app/features/rooms/domain/use_case/fetch_rooms_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_rooms_event.dart';
part 'fetch_rooms_state.dart';

class FetchRoomsBloc extends Bloc<FetchRoomsEvent, FetchRoomsState> {
  final FetchRoomsUseCase fetchRoomsUseCase;

  FetchRoomsBloc({required this.fetchRoomsUseCase})
    : super(FetchRoomsInitial()) {
    on<FetchRooms>(fetchRooms);
  }

  void fetchRooms(FetchRooms event, Emitter<FetchRoomsState> emit) async {
    emit(FetchRoomsLoading());
    try {
      final response = await fetchRoomsUseCase(NoParams());

      response.fold(
        (failure) => emit(FetchRoomsFailure(failure: failure)),
        (success) => emit(FetchRoomsSuccess(rooms: success)),
      );
    } catch (e) {
      emit(FetchRoomsFailure(failure: Failure()));
    }
  }
}
