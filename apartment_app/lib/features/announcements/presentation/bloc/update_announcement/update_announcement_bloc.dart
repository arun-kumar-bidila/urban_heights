import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/features/announcements/domain/use_case/update_announcement_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_announcement_event.dart';
part 'update_announcement_state.dart';

class UpdateAnnouncementBloc
    extends Bloc<UpdateAnnouncementEvent, UpdateAnnouncementState> {
  final UpdateAnnouncementUseCase updateAnnouncementUseCase;
  UpdateAnnouncementBloc({required this.updateAnnouncementUseCase})
    : super(UpdateAnnouncementInitial()) {
    on<UpdateAnnouncement>(updateAnnouncement);
  }
  void updateAnnouncement(
    UpdateAnnouncement event,
    Emitter<UpdateAnnouncementState> emit,
  ) async {
    emit(UpdateAnnouncementLoading());
    try {
      final response = await updateAnnouncementUseCase(
        UpdateAnnouncementUseCaseParams(
          announcementId: event.params.announcementId,
          pinned: event.params.pinned,
        ),
      );

      response.fold(
        (failure) => emit(UpdateAnnouncementFailure(failure: failure)),
        (success) => emit(UpdateAnnouncementSuccess()),
      );
    } catch (e) {
      emit(UpdateAnnouncementFailure(failure: Failure()));
    }
  }
}
