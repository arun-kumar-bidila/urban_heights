import 'package:apartment_app/core/failure.dart';

import 'package:apartment_app/features/announcements/domain/use_case/delete_announcement_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_announcement_event.dart';
part 'delete_announcement_state.dart';

class DeleteAnnouncementBloc
    extends Bloc<DeleteAnnouncementEvent, DeleteAnnouncementState> {
  final DeleteAnnouncementUseCase deleteAnnouncementUseCase;

  DeleteAnnouncementBloc({required this.deleteAnnouncementUseCase})
    : super(DeleteAnnouncementInitial()) {
    on<DeleteAnnouncement>(deleteAnnouncement);
  }

  void deleteAnnouncement(
    DeleteAnnouncement event,
    Emitter<DeleteAnnouncementState> emit,
  ) async {
    emit(DeleteAnnouncementLoading());
    try {
      final response = await deleteAnnouncementUseCase(
        DeleteAnnouncementUseCaseParams(
          announcementId: event.deleteAnnouncementUseCaseParams.announcementId,
        ),
      );

      response.fold(
        (failure) => emit(DeleteAnnouncementFailure(failure: failure)),
        (success) => emit(DeleteAnnouncementSuccess()),
      );
    } catch (e) {
      emit(DeleteAnnouncementFailure(failure: Failure()));
    }
  }
}
