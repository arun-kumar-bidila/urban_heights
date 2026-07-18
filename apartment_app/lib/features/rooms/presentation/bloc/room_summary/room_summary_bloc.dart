import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/rooms/domain/entity/room_summary_entity.dart';
import 'package:apartment_app/features/rooms/domain/use_case/fetch_room_summary_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'room_summary_event.dart';
part 'room_summary_state.dart';

class RoomSummaryBloc extends Bloc<RoomSummaryEvent, RoomSummaryState> {
  final FetchRoomSummaryUseCase fetchRoomSummaryUseCase;
  RoomSummaryBloc({required this.fetchRoomSummaryUseCase})
    : super(RoomSummaryInitial()) {
    on<RoomSummary>(fetchRoomSummary);
  }

  void fetchRoomSummary(
    RoomSummary event,
    Emitter<RoomSummaryState> emit,
  ) async {
    emit(RoomSummaryLoading());
    try {
      final response = await fetchRoomSummaryUseCase(NoParams());

      response.fold(
        (failure) => emit(RoomSummaryFailure(failure: failure)),
        (success) => emit(RoomSummarySuccess(roomSummary: success)),
      );
    } catch (e) {
      emit(RoomSummaryFailure(failure: Failure()));
    }
  }
}
