import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/announcements/domain/entity/announcement_entity.dart';
import 'package:apartment_app/features/announcements/domain/use_case/fetch_announcements_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_announcements_event.dart';
part 'fetch_announcements_state.dart';

class FetchAnnouncementsBloc
    extends Bloc<FetchAnnouncementsEvent, FetchAnnouncementsState> {
  final FetchAnnouncementsUseCase fetchAnnouncementsUseCase;
  FetchAnnouncementsBloc({required this.fetchAnnouncementsUseCase})
    : super(FetchAnnouncementsInitial()) {
    on<FetchAnnouncements>(fetchAnnouncement);
  }

  void fetchAnnouncement(
    FetchAnnouncements event,
    Emitter<FetchAnnouncementsState> emit,
  ) async {
    emit(FetchAnnouncementsLoading());
    try {
      final response = await fetchAnnouncementsUseCase(NoParams());

      response.fold(
        (failure) => emit(FetchAnnouncementsFailure(failure: failure)),
        (success) => emit(FetchAnnouncementsSuccess(announcements: success)),
      );
    } catch (e) {
      emit(FetchAnnouncementsFailure(failure: Failure()));
    }
  }
}
